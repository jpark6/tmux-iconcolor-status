#!/usr/bin/env bash

set_status_left_format() {
  if [ "$#" = 0 ]; then
    status_left_format=""
    tmux set -g status-justify left
  elif [ "$#" = 1 ]; then
    status_left_format="#[fg=$c2,bg=$c1] $1 #[fg=$c1,bg=$bg_c]$section_r_icon "
  elif [ "$#" = 2 ]; then
    status_left_format="#[fg=$c2,bg=$c1] $1 #[fg=$c1,bg=$c2]$section_r_icon $2 #[fg=$c2,bg=$bg_c]$section_r_icon "
  elif [ "$#" = 3 ]; then
    status_left_format="#[fg=$c2,bg=$c1] $1 #[fg=$c1,bg=$c2]$section_r_icon#[fg=$c1,bg=$c2] $2 #[fg=$c2,bg=$c3]$section_r_icon#[fg=$c1,bg=$c3] $3 #[fg=$c3,bg=$bg_c]$section_r_icon "
  else
    status_left_format=""
    tmux set -g status-justify left
  fi

  tmux set -g status-left "$status_left_format"
}

set_status_right_format() {
  if [ "$#" = 0 ]; then
    status_right_format=""
  elif [ "$#" = 1 ]; then
    status_right_format="#[fg=$c1,bg=$bg_c]$section_l_icon#[fg=$c2,bg=$c1] $1 "
  elif [ "$#" = 2 ]; then
    status_right_format="#[fg=$c2,bg=$bg_c]$section_l_icon#[fg=$c1,bg=$c2] $1 #[fg=$c1,bg=$c2]$section_l_icon#[fg=$c2,bg=$c1] $2 "
  elif [ "$#" = 3 ]; then
    status_right_format="#[fg=$c3,bg=$bg_c]$section_l_icon#[fg=$c1,bg=$c3] $1 #[fg=$c2,bg=$c3]$section_l_icon#[fg=$c1,bg=$c2] $2 #[fg=$c1,bg=$c2]$section_l_icon#[fg=$c2,bg=$c1] $3 "
  elif [ "$#" = 4 ]; then
    status_right_format="#[fg=$c3,bg=$bg_c]$section_l_icon#[fg=$c1,bg=$c3] $1 #[fg=$c2,bg=$c3]$section_l_icon#[fg=$c1,bg=$c2] $2 #[fg=$c1,bg=$c2]$section_l_icon#[fg=$c2,bg=$c1] $3$([ -n "$sp_l_icon" ] && echo " $sp_l_icon " || echo " ")$4 "
  else 
    status_right_format=""
  fi

  tmux set -g status-right "$status_right_format"
}

set_status_left() {
  local show_session="$(tmux show -gqv @iconcolor-show-session)"
  local show_user="$(tmux show -gqv @iconcolor-show-user)"
  local show_pane="$(tmux show -gqv @iconcolor-show-pane)"
  local user_format="$(tmux show -gqv @iconcolor-user-format)"

  local session_icon_text="$session_icon#S"
  local user_icon_text="$user_icon${user_format:-"#(whoami)"}"
  local pane_icon_text="$pane_icon#{window_index}:#{pane_index}"

  local icon_text_array=()
  if [ -z "$show_session" ] || [ "$show_session" != "off"  ]; then
    icon_text_array+=("$session_icon_text")
  fi

  if [ -z "$show_user" ] || [ "$show_user" != "off"  ]; then
    icon_text_array+=("$user_icon_text")
  fi

  if [ -z "$show_pane" ] || [ "$show_pane" != "off"  ]; then
    icon_text_array+=("$pane_icon_text")
  fi

  set_status_left_format "${icon_text_array[@]}"

  tmux set -g status-left-length 200
}

set_status_center() {
  tmux set -g status-style "fg=$c1,bg=$bg_c"

  # tmux set -g window-status-format "#[fg=$c1,bg=$bg_c ]#{?window_last_flag,$last_icon,}#{?window_zoomed_flag,$zoom_icon,}#I.#W"
  tmux set -g window-status-format "#[fg=$c2,bg=$bg_c]$section_l_icon#[fg=$c1,bg=$c2] #{?window_last_flag,$last_icon,}#{?window_zoomed_flag,$zoom_icon,}#I$([ -n "$sp_r_icon" ] && echo " $sp_r_icon " || echo ".")#W #[default]#[fg=$c2,bg=$bg_c]$section_r_icon"
  tmux set -g window-status-current-format "#[fg=$c1,bg=$bg_c]$section_l_icon#[fg=$c2,bg=$c1,bold] $curr_icon#{?window_zoomed_flag,$zoom_icon,}#[bold,italics]#I$([ -n "$sp_r_icon" ] && echo " $sp_r_icon " || echo ".")#W #[default]#[fg=$c1,bg=$bg_c]$section_r_icon"
  # tmux set -g window-status-separator "$([ -z "$section_l_icon" ] && [ -z "$section_r_icon" ] && echo " ")"
  tmux set -g window-status-separator " "
}

set_status_right() {
  # get global options for status right
  local show_time="$(tmux show -gqv @iconcolor-show-time)"
  local show_date="$(tmux show -gqv @iconcolor-show-date)"
  local show_cpu_mem="$(tmux show -gqv @iconcolor-show-cpu-mem)"
  local show_battery="$(tmux show -gqv @iconcolor-show-battery)"
  local time_format="$(tmux show -gqv @iconcolor-time-format)"
  local date_format="$(tmux show -gqv @iconcolor-date-format)"

  # set global option for tmux-battery plugins
  tmux set -g @batt_icon_status_charged "$batt_charged_icon"
  tmux set -g @batt_icon_status_charging "$batt_charging_icon"
  tmux set -g @batt_icon_status_discharging "$batt_discharged_icon"
  tmux set -g @batt_icon_status_attached "$batt_charging_icon"

  local time_icon_text="$time_icon${time_format:-"%H:%M:%S"}" # default - %X : HH24:MM:SS
  local date_icon_text="$date_icon${date_format:-"%y/%m/%d"}" # default - %y/%m/%d YY/MM/DD
  local cpu_mem_icon_text="$cpu_icon#{cpu_percentage}$([ -n "$sp_l_icon" ] && echo " $sp_l_icon " || echo " ")$mem_icon#{ram_percentage}"
  # local cpu_mem_icon_text="$cpu_icon"
  local battery_icon_text="#{battery_icon_status}#{battery_percentage}"


  local icon_text_array=()
  # if not set options:
  # show time date / hide cpu_mem battery
  if [ -z "$show_time" ] || [ "$show_time" != "off" ]; then
    icon_text_array+=("$time_icon_text")
  fi

  if [ -z "$show_date" ] || [ "$show_date" != "off"  ]; then
    icon_text_array+=("$date_icon_text")
  fi

  if [ -n "$show_cpu_mem" ] && [ "$show_cpu_mem" = "on"  ]; then
    icon_text_array+=("$cpu_mem_icon_text")
  fi

  if [ -n "$show_battery" ] && [ "$show_battery" = "on"  ]; then
    icon_text_array+=("$battery_icon_text")
  fi

    set_status_right_format "${icon_text_array[@]}"
    
  tmux set -g status-right-length 200
  tmux set -g status-interval 1
}

