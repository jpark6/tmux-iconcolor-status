#!/usr/bin/env bash

set_colors() {
  colors_string="$(echo ${@} | tr -d ' ')"
  IFS=',' read -ra colors_array <<< "$colors_string"

  if [[ -z ${colors_array[0]} ]]; then
    bg_c="default"
  elif [[ ${colors_array[0]} = 'light' || ${colors_array[0]} = 'white' ]]; then
    bg_c="white"
  elif [[ ${colors_array[0]} = 'dark' || ${1} = 'black' ]]; then
    bg_c="black"
  elif [[ ${colors_array[0]} = 'default' ]]; then
    bg_c="default"
  else
    bg_c="${colors_array[0]}"
  fi

  c1=${colors_array[1]:-"default"}
  c2=${colors_array[2]:-"dark"}
  c3=${colors_array[3]:-"default"}
}

set_separators() {
  separators_string=$@
  IFS=',' read -ra separators_array <<< "$separators_string"

  section_l_icon=${separators_array[0]}
  section_r_icon=${separators_array[1]}
  sp_l_icon=${separators_array[2]}
  sp_r_icon=${separators_array[3]}

}
set_icons() {
  icons_string=$@
  IFS=',' read -ra icons_array <<< "$icons_string"

  session_icon=${icons_array[0]}
  user_icon=${icons_array[1]}
  pane_icon=${icons_array[2]}
  curr_icon=${icons_array[3]}
  prev_icon=${icons_array[4]}
  zoom_icon=${icons_array[5]}
  time_icon=${icons_array[6]}
  date_icon=${icons_array[7]}
  cpu_icon=${icons_array[8]:-"󰯲 "}
  mem_icon=${icons_array[9]:-"󰰐 "}
  batt_charged_icon=${icons_array[10]:-" "}
  batt_discharged_icon=${icons_array[11]:-"󰁾 "}
  batt_charging_icon=${icons_array[12]:-"󰢝 "}
}

set_status_left() {
  global_show_user_name=$(tmux show -gqv @tmux-status-show-user-name)
  if [ -n "$global_show_user_name" ] && [ "$global_show_user_name" = "off"  ]; then 
    tmux set -g status-left "#[fg=$c2,bg=$c1] $session_icon#S$([ -z "$section_r_icon"] && echo " ")#[fg=$c1,bg=$c2]$section_r_icon $pane_icon#{window_index}:#{pane_index}$([ -z "$section_r_icon"] && echo " ")#[fg=$c2,bg=$bg_c]$section_r_icon"
  else
    tmux set -g status-left "#[fg=$c2,bg=$c1] $session_icon#S$([ -z "$section_r_icon"] && echo " ")#[fg=$c1,bg=$c2]$section_r_icon#[fg=$c1,bg=$c2] $user_icon#(whoami)$([ -z "$section_r_icon"] && echo " ")#[fg=$c2,bg=$c3]$section_r_icon#[fg=$c1,bg=$c3] $pane_icon#{window_index}:#{pane_index}$([ -z "$section_r_icon"] && echo " ")#[fg=$c3,bg=$bg_c]$section_r_icon "
  fi

  tmux set -g status-left-length 200
}

set_status_center() {
  tmux set -g status-style "fg=$c1,bg=$bg_c"

  tmux set -g status-justify centre # centre left right
  tmux set -g window-status-format "#[fg=$c1,bg=$bg_c] #{?window_zoomed_flag,$zoom_icon,#{?window_last_plag,$prev_icon,}}#I.#W"
  tmux set -g window-status-current-format "#[fg=$c1,bg=$bg_c]$section_l_icon#[fg=$c2,bg=$c1,bold]$([ -z "$section_r_icon"] && echo " ")#{?window_zoomed_flag,$zoom_icon,$curr_icon}#[bold,italics]#I${sp_r_icon:-"."}#W$([ -z "$section_r_icon"] && echo " ")#[default]#[fg=$c1,bg=$bg_c]$section_r_icon"
  tmux set -g window-status-separator " "
}

set_status_right() {
  local status_right="#[fg=$c3,bg=$bg_c,align=right]$section_l_icon#[fg=$c1,bg=$c3]$([ -z "$section_l_icon"] && echo " ")$time_icon%H:%M:%S #[fg=$c2,bg=$c3]$section_l_icon#[fg=$c1,bg=$c2]$([ -z "$section_l_icon"] && echo " ")$date_icon%y/%m/%d "
  local show_mem_cpu=${1}
  local show_battery=${2}

  tmux set -g @batt_icon_status_charged "$batt_charged_icon"
  tmux set -g @batt_icon_status_charging "$batt_charging_icon"
  tmux set -g @batt_icon_status_discharging "$batt_discharged_icon"
  tmux set -g @batt_icon_status_attached "$batt_charging_icon"

  if [ -n "$show_mem_cpu" ] && [ "$show_mem_cpu" = "on" ] &&
     [ -n "$show_battery" ] && [ "$show_battery" = "on" ]; then 
    IFS='  ' read -ra mem_cpu_array <<< "$(tmux-mem-cpu-load -m 2 -g 0 -a 0 -i 1)"
    tmux set -g status-right "$status_right#[fg=$c1,bg=$c2]$section_l_icon#[fg=$c2,bg=$c1]$([ -z "$section_l_icon"] && echo " ")$cpu_icon${mem_cpu_array[1]}%$([ -z "$sp_l_icon"] && echo " ")$sp_l_icon$mem_icon${mem_cpu_array[0]}%$([ -z "$sp_l_icon"] && echo " ")$sp_l_icon#{battery_icon_status}#{battery_percentage}% "
  elif [ -n "$show_mem_cpu" ] && [ "$show_mem_cpu" = "on" ]; then 
    IFS='  ' read -ra mem_cpu_array <<< "$(tmux-mem-cpu-load -m 2 -g 0 -a 0 -i 1)"
    tmux set -g status-right "$status_right#[fg=$c1,bg=$c2]$section_l_icon#[fg=$c2,bg=$c1]$([ -z "$section_l_icon"] && echo " ")$cpu_icon${mem_cpu_array[1]}%$([ -z "$sp_l_icon"] && echo " ")$sp_l_icon$mem_icon${mem_cpu_array[0]}% "
  elif [ -n "$show_battery" ] && [ "$show_battery" = "on" ]; then 
    tmux set -g status-right "$status_right#[fg=$c1,bg=$c2]$section_l_icon#[fg=$c2,bg=$c1] #{battery_icon_status}#{battery_percentage}% "
  else 
    tmux set -g status-right "#[fg=$c2,bg=$bg_c,align=right]$section_l_icon#[fg=$c1,bg=$c2]$([ -z "$section_l_icon"] && echo " ")$time_icon%H:%M:%S #[fg=$c1,bg=$c2]$section_l_icon#[fg=$c2,bg=$c1]$([ -z "$section_l_icon"] && echo " ")$date_icon%y/%m/%d "
  fi
  tmux set -g status-right-length 200
  tmux set -g status-interval 1
}


main() {
  # options in ./preset.sh have higher priority than options in ~/.tmux.conf
  # bash ./preset.sh 

  set_colors $(tmux show -gqv @tmux-status-colors)
  set_separators $(tmux show -gqv @tmux-status-separators)
  set_icons $(tmux show -gqv @tmux-status-icons)
  
  set_status_left
  set_status_center
  set_status_right $(tmux show -gqv @tmux-status-show-cpu-mem) $(tmux show -gqv @tmux-status-show-battery)

  tmux set -g pane-active-border-style "fg=$c1"
}

main "$@"
