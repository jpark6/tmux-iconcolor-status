#!/usr/bin/env bash

set_colors() {
  local colors_string="$(echo ${@} | tr -d ' ')"
  IFS=',' read -ra colors_array <<< "$colors_string"

  c1=${colors_array[0]:-"default"}
  c2=${colors_array[1]:-"none"}
  c3=${colors_array[2]:-"default"}

  if [[ -z ${colors_array[3]} ]]; then
    bg_c="default"
  elif [[ ${colors_array[3]} = 'light' || ${colors_array[3]} = 'white' ]]; then
    bg_c="white"
  elif [[ ${colors_array[3]} = 'dark' || ${colors_array[3]} = 'black' ]]; then
    bg_c="black"
  elif [[ ${colors_array[3]} = 'default' ]]; then
    bg_c="default"
  else
    bg_c="${colors_array[3]}"
  fi
}

set_separators() {
  local separators_string=$@
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
  last_icon=${icons_array[4]}
  zoom_icon=${icons_array[5]}
  time_icon=${icons_array[6]}
  date_icon=${icons_array[7]}
  cpu_icon=${icons_array[8]:-"󰯲 "}
  mem_icon=${icons_array[9]:-"󰰐 "}
  batt_charged_icon=${icons_array[10]:-" "}
  batt_discharged_icon=${icons_array[11]:-"󰁾 "}
  batt_charging_icon=${icons_array[12]:-"󰢝 "}
}

set_status_left_format() {
  if [ "$#" = 0 ]; then
    status_left_format=""
    tmux set -g status-justify left
  elif [ "$#" = 1 ]; then
    status_left_format="#[ fg=$c2,bg=$c1 ] $1$([ -z "$section_r_icon" ] && echo " ")#[ fg=$c1,bg=$bg_c ]$section_r_icon"
  elif [ "$#" = 2 ]; then
    status_left_format="#[ fg=$c2,bg=$c1 ] $1$([ -z "$section_r_icon" ] && echo " ")#[ fg=$c1,bg=$c2 ]$section_r_icon$([ -z "$section_r_icon" ] && echo " ")$2$([ -z "$section_r_icon" ] && echo " ")#[ fg=$c2,bg=$bg_c ]$section_r_icon "
  elif [ "$#" = 3 ]; then
    status_left_format="#[ fg=$c2,bg=$c1 ] $1$([ -z "$section_r_icon" ] && echo " ")#[ fg=$c1,bg=$c2 ]$section_r_icon#[ fg=$c1,bg=$c2 ]$([ -z "$section_r_icon" ] && echo " ")$2$([ -z "$section_r_icon" ] && echo " ")#[ fg=$c2,bg=$c3 ]$section_r_icon#[ fg=$c1,bg=$c3 ]$([ -z "$section_r_icon" ] && echo " ")$3$([ -z "$section_r_icon" ] && echo " ")#[ fg=$c3,bg=$bg_c ]$section_r_icon "
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
    status_right_format="#[ fg=$c1,bg=$bg_c ]$section_l_icon#[ fg=$c2,bg=$c1 ]$([ -z "$section_l_icon" ] && echo " ")$1$([ -z "$section_l_icon" ] && echo " ")"
  elif [ "$#" = 2 ]; then
    status_right_format="#[ fg=$c2,bg=$bg_c,align=right ]$section_l_icon#[ fg=$c1,bg=$c2 ]$([ -z "$section_l_icon" ] && echo " ")$1$([ -z "$section_l_icon" ] && echo " ")#[ fg=$c1,bg=$c2 ]$section_l_icon#[ fg=$c2,bg=$c1 ]$([ -z "$section_l_icon" ] && echo " ")$2 "
  elif [ "$#" = 3 ]; then
    status_right_format="#[ fg=$c3,bg=$bg_c,align=right ]$section_l_icon#[ fg=$c1,bg=$c3 ]$([ -z "$section_l_icon" ] && echo " ")$1$([ -z "$section_l_icon" ] && echo " ")#[ fg=$c2,bg=$c3 ]$section_l_icon#[ fg=$c1,bg=$c2 ]$([ -z "$section_l_icon" ] && echo " ")$2$([ -z "$section_l_icon" ] && echo " ")#[ fg=$c1,bg=$c2 ]$section_l_icon#[ fg=$c2,bg=$c1 ]$([ -z "$section_l_icon" ] && echo " ")$3 "
  elif [ "$#" = 4 ]; then
    status_right_format="#[ fg=$c3,bg=$bg_c,align=right ]$section_l_icon#[ fg=$c1,bg=$c3 ]$([ -z "$section_l_icon" ] && echo " ")$1$([ -z "$section_l_icon" ] && echo " ")#[ fg=$c2,bg=$c3 ]$section_l_icon#[ fg=$c1,bg=$c2 ]$([ -z "$section_l_icon" ] && echo " ")$2$([ -z "$section_l_icon" ] && echo " ")#[ fg=$c1,bg=$c2 ]$section_l_icon#[ fg=$c2,bg=$c1 ]$([ -z "$section_l_icon" ] && echo " ")$3$sp_l_icon$([ -z "$sp_l_icon" ] && echo " ")$4 "
  else 
    status_right_format=""
  fi

  tmux set -g status-right "$status_right_format"
}

set_status_left() {
  local show_session=$(tmux show -gqv @iconcolor-show-session)
  local show_user=$(tmux show -gqv @iconcolor-show-user)
  local show_pane=$(tmux show -gqv @iconcolor-show-pane)

  local session_icon_text="$session_icon#S"
  local user_icon_text="$user_icon#(whoami)"
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

  tmux set -g window-status-format "#[ fg=$c1,bg=$bg_c ]#{?window_last_flag,$last_icon,}#{?window_zoomed_flag,$zoom_icon,}#I.#W"
  tmux set -g window-status-current-format "#[ fg=$c1,bg=$bg_c ]$section_l_icon#[ fg=$c2,bg=$c1,bold ]$([ -z "$section_r_icon" ] && echo " ")$curr_icon#{?window_zoomed_flag,$zoom_icon,}#[ bold,italics ]#I${sp_r_icon:-"."}#W$([ -z "$section_r_icon" ] && echo " ")#[ default ]#[ fg=$c1,bg=$bg_c ]$section_r_icon"
  tmux set -g window-status-separator " "
}

set_status_right() {
  local show_time=$(tmux show -gqv @iconcolor-show-time)
  local show_date=$(tmux show -gqv @iconcolor-show-date)
  local show_cpu_mem=$(tmux show -gqv @iconcolor-show-cpu-mem)
  local show_battery=$(tmux show -gqv @iconcolor-show-battery)

  tmux set -g @batt_icon_status_charged "$batt_charged_icon"
  tmux set -g @batt_icon_status_charging "$batt_charging_icon"
  tmux set -g @batt_icon_status_discharging "$batt_discharged_icon"
  tmux set -g @batt_icon_status_attached "$batt_charging_icon"

  local time_icon_text="$time_icon%H:%M:%S"
  local date_icon_text="$date_icon%y/%m/%d"
  local cpu_mem_icon_text="$cpu_icon#{cpu_percentage}$([ -z "$sp_l_icon" ] && echo " ")$sp_l_icon$mem_icon#{ram_percentage}"
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

set_theme() {
  theme_string="$(echo ${@} | tr -d ' ')"
  IFS=',' read -ra theme_array <<< "$theme_string"

  local color=$(echo ${theme_array[0]:-"default"} | tr '[:upper:]' '[:lower:]')
  local separator=$(echo ${theme_array[1]:-"none"} | tr '[:upper:]' '[:lower:]')
  local icon=$(echo ${theme_array[2]:-"default"} | tr '[:upper:]' '[:lower:]')

  colors=""
  local separators=""
  local icons=""

  case $color in
    coffee)
      colors="#96624C,#CC8A6A,#FABB85,default"
      ;;
    cold)
      colors="#005DFA,#8CB2F1,#D0CEDD,default"
      ;;
    cyberpunk)
      colors="#541690,#FF4949,#FFCD38,default"
      ;;
    flame)
      colors="#A62C2C,#E83F25,#EA7300,default"
      ;;
    forest)
      colors="#16610E,#F97A00,#FED16A,default"
      ;;
    gradient-blue)
      colors="#3D90D7,#7AC6D2,#B5FCCD,default"
      ;;
    gradient-green)
      colors="#1A5319,#80AF81,#D6EFD8,default"
      ;;
    gradient-orange)
      colors="#FA812F,#F3C623,#FEF3E2,default"
      ;;
    gradient-purple)
      colors="#AA60C8,#D69ADE,#FFDFEF,default"
      ;;
    mint)
      colors="#139E74,#BAFFE5,#E2FFF4,default"
      ;;
    neon-purple)
      colors="#952F7C,#45CC38,#CAAC00,default"
      ;;
    neon-yellow)
      colors="#FCC737,#F27B0F,#7E1891,default"
      ;;
    nord)
      colors="#88C0D0,#2E3440,#FFFFFF,default"
      ;;
    ocean)
      colors="#050C9C,#3572EF,#3ABEF9,default"
      ;;
    olivegray)
      colors="#626F47,#A4B465,#F5ECD5,default"
      ;;
    pastel-brown)
      colors="#4B352A,#CA7842,#B2CD9C,default"
      ;;
    pastel-cyan)
      colors="#00809D,#FCECDD,#FF7601,default"
      ;;
    pastel-cyan2)
      colors="#5EABD6,#FEFBC7,#FFB4B4,default"
      ;;
    pastel-peach)
      colors="#FF4F33,#FFE6E1,#075B5E,default"
      ;;
    pastel-purple)
      colors="#B1AFFF,#FDFDBD,#C8FFD4,default"
      ;;
    pastel|pastel-pink)
      colors="#FD8A8A,#F1F7B5,#A8D1D1,default"
      ;;
    tokyonight)
      colors="#0A0047,#00FFD2,#FF4499,default"
      ;;
    whitegreen)
      colors="#EFE4D2,#254D70,#2F80BF,default"
      ;;
    *)
      colors=""
      ;;
  esac
  set_colors "$colors"

  case $separator in
    round)
      separators=" , , , ,"
      ;;
    flame)
      separators=" , , , ,"
      ;;
    none)
      separators=",,┃,┃," # "█"
      ;;
    pixel)
      separators=" , ,┃,┃,"
      ;;
    slant-down)
      separators=",,,,"
      ;;
    slant-left)
      separators=",,,,"
      ;;
    slant-up)
      separators=",,,,"
      ;;
    slant|slant-right)
      separators=",,,,"
      ;;
    triangle-inverse)
      separators=",,,,"
      ;;
    triangle-left)
      separators=",, , ,"
      ;;
    triangle-right)
      separators=",,,,"
      ;;
    triangle|triangle-both)
      separators=",,,,"
      ;;
    wave)
      separators=" ,,┃,┃,"
      ;;
    *)
      separators=""
      ;;
  esac
  set_separators "$separators"

  case $icon in
    construction-emoji)
      icons="🧱,👷,🪟 ,🏗 ,🚧,🔍,⏳️,📅, , , ,󱊢 ,󱊥 ,"
      ;;
    music-emoji)
      icons="🎹,🕺,🥁,🎸,🎶,🔍,🕰 ,📆,󰯲 ,󰰐 ,󰚥 , ,󰂄 ,"
      ;;
    night-emoji)
      icons="🌃,😪,🪟 ,🌙,💤,🔍,⏳️,📅,i, , ,󰁾 ,󰢝 ,"
      ;;
    sport-emoji)
      icons="🏟 ,🏊,🏓,⚽ ,🥅,🔍,⏳️,📆,󰯲 ,󰰐 , ,󰁾 ,󰢝 ,"
      ;;
    target-emoji)
      icons="🖥 ,🤖 ,🪟 ,🎯,✨,🔍,🕐,📅, , ,⚡️,🪫,🔋,"
      ;;
    winter-emoji)
      icons="🏔 ,⛄,🚠 ,🏂 ,🍧,🔍,⌚️,🎄,󰯲 ,󰰐 ,󱐥 ,󰁾 ,󰢝 ,"
      ;;
    airplane)
      icons="󰒋 ,󱟄, , , , ,󱦟 ,󰸗 , , , ,󰁾 ,󰢝 ,"
      ;;
    biohazard)
      icons="󰒋 ,󰙌, , , , , ,󰸗 , , , ,󰁾 ,󰢝 ,"
      ;;
    curvedarrow)
      icons=" , , , , , , ,󰸗 , , , ,󰁾 ,󰢝 ,"
      ;;
    rocket)
      icons="󱠇 ,󰙊 , ,󱓞 , , ,󱦟 ,󰸗 , , , ,󰁾 ,󰢝 ,"
      ;;
    important)
      icons="󰥱 ,󰙄 ,󰪟 ,󰀨 , , ,󱑁 ,󰸗 ,󰯲 ,󰰐 , ,󰁾 ,󰢝 ,"
      ;;
    music)
      icons=" , , ,󰎇 ,󰽺 , , ,󰸗 , , , ,󰁾 ,󰢝 ,"
      ;;
    play)
      icons=" , , , , , , ,󰸗 , , , ,󰁾 ,󰢝 ,"
      ;;
    playround)
      icons="  ,󰙄 ,󱪳 , , , ,󱎫 ,󰸘 ,󰯲 ,󰰐 ,󰚥 , ,󰂄 ,"
      ;;
    ship)
      icons="󰒋 ,󱟄, , ,󰄬 , ,󱦟 ,󰸗 , , , ,󱊢 ,󱊥 ,"
      ;;
    sport)
      icons="󰠴 ,󰑮 ,󱉾  ,  ,󰦶 , ,󰔛 , , , ,󰚥 , ,󰂄 ,"
      ;;
    star)
      icons=" , , ,󱝂 , , , ,󰸗 , , , ,󰁾 ,󰢝 ,"
      ;;
    steeringwheel)
      icons="󰒋 , ,󱪳 ,󰠳 , , ,󱎫 ,󰸘 ,C:,M:, ,󰁾 ,󰢝 ,"
      ;;
    study)
      icons="󰹕 ,󰶪 ,󰃥 , 󰙏 ,󰸕 , ,󱫍 , , ,i, ,󰁾 ,󰢝 ,"
      ;;
    sun)
      icons=" ,󱗌 ,󰕮 ,󰖙 , , ,󱎫 ,󰸘 ,󰯲 ,󰰐 , ,󰁾 ,󰢝 ,"
      ;;
    surf)
      icons=" ,󱎂 ,󰠡 ,󱝆 ,󱁕, ,󰄉 ,󰸗 , , , ,󰁾 ,󰢝 ,"
      ;;
    target)
      icons=" ,󱚟 ,󰠡 ,󰣉 , , ,󱦟 ,󰸗 ,󰯲 ,󰰐 , ,󰁾 ,󰢝 ,"
      ;;
    target)
      icons="󰕲 ,󰙄 , ,󰣉 , , ,󱦟 ,󰸗 , , , ,󰁾 ,󰢝 ,"
      ;;
    wave)
      icons="󰞍 ,󱝆 ,󱢋 ,󱢴 ,󱁕 , ,󰄉 ,󰸗 , , , ,󰁾 ,󰢝 ,"
      ;;
    winter)
      icons=" , ,󰶛 , , , ,󰔛 , ,󰯲 ,󰰐 , ,󰁾 ,󰢝 ,"
      ;;
    *)
      icons=""
      ;;
  esac
  set_icons "$icons"
}

main() {
  # options in ./preset.sh have higher priority than options in ~/.tmux.conf
  # bash ./preset.sh 
  tmux run-shell $HOME/.tmux/plugins/tmux-battery/battery.tmux

  local theme="$(tmux show -gqv @iconcolor-theme)"

  if [ -n "$theme" ]; then 
    set_theme "$theme"
  fi

  local colors="$(tmux show -gqv @iconcolor-colors)"
  if [ -n "$colors" ]; then 
    set_colors "$colors"
  fi

  local separators="$(tmux show -gqv @iconcolor-separators)"
  if [ -n "$separators" ]; then 
    set_separators "$separators"
  fi

  local icons="$(tmux show -gqv @iconcolor-icons)"
  if [ -n "$icons" ]; then 
    set_icons "$icons"
  fi
  
  tmux set -g status-justify centre # centre left right

  set_status_left
  set_status_center
  set_status_right

  tmux set -g pane-active-border-style "fg=$c1"
}

main "$@"
