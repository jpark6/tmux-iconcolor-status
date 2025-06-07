#!/usr/bin/env sh

status_bg_color="default" # statusbar background color
color1="#16610E" # session & current window background color
color2="#F97A00" # session & current window foreground color
color3="#FED16A" # username background color
color4="#FFF4A4" # inactive window background color

separator_start_icon=""
separator_end_icon=""
session_icon=" "
user_icon=" "
pane_icon=" "
status_current_icon=" "
time_icon=" "
date_icon="󰸗 "
mem_icon=" "
cpu_icon=" "

set_color() {
  if [[ $1 = 'light' ]]; then
    status_bg_color="white"
  elif [[ $1 = 'dark' ]]; then
    status_bg_color="black"
  fi

  color1="$2"
  color2="$3"
  color3="$4"
  color4="$5"
  color5="$6"
}

set_icons() {
  separator_start_icon="$1"
  separator_end_icon="$2"
  session_icon="$3"
  user_icon="$4"
  pane_icon="$5"
  status_current_icon="$6"
  time_icon="$7"
  date_icon="$8"
  mem_icon="$9"
  cpu_icon="${10}"
}

status_left() {
  tmux set -g status-left "#[fg=$color2,bg=$color1] $session_icon#S #[fg=$color1,bg=$color2]$separator_end_icon $user_icon#(whoami) #[fg=$color2,bg=$color3]$separator_end_icon#[fg=$color1,bg=$color3] $pane_icon#{window_index}:#{pane_index} #[fg=$color3,bg=$status_bg_color]$separator_end_icon"
  tmux set -g status-left-length 200
}

status_center() {
  tmux set -g status-style "fg=$color1,bg=$status_bg_color"

  tmux set -g status-justify centre
  tmux set -g window-status-format "#[fg=$color4,bg=$status_bg_color] $separator_start_icon#[fg=$color1,bg=$color4] #I:#W#F #[fg=$color4,bg=$status_bg_color]$separator_end_icon"
  tmux set -g window-status-current-format "#[fg=$color1,bg=$status_bg_color] $separator_start_icon#[fg=white,bg=$color1] $status_current_icon#I:#W#F #[fg=$color1,bg=$status_bg_color]$separator_end_icon"
  tmux set -g window-status-separator ""
}

status_right() {
  tmux set -g status-right "#[fg=$color3,bg=$status_bg_color]$separator_start_icon#[fg=$color1,bg=$color3] $time_icon%H:%M:%S #[fg=$color2,bg=$color3]$separator_start_icon#[fg=$color1,bg=$color2] $date_icon%Y/%m/%d #[fg=$color1,bg=$color2]$separator_start_icon#[fg=$color2,bg=$color1] $mem_icon #(tmux-mem-cpu-load -m 2 -g 0 -a 0 -i 1 | sed 's|  | $cpu_icon |g') #[default]"
  tmux set -g status-right-length 200
  tmux set -g status-interval 1
}

main() {
  # color references : https://colorhunt.co/
  # set_color "default" "#16610E" "#F97A00" "#FED16A" "#FFF4A4" # green orange
  # set_color "dark" "#626F47" "#A4B465" "#F5ECD5" "#F0BB78" # gray olive
  # set_color "default" "#11009E" "#4942E4" "#8696FE" "#C4B0FF" # cold - navy blue people
  # set_color "default" "#541690" "#FF4949" "#FF8D29" "#FFCD38" # cyberpunk - purple pink orange
  # set_color "light" "#11009E" "#4942E4" "#8696FE" "#C4B0FF" # cold - navy blue people
  # set_color default teal yellowgreen cyan yellow
  # set_color default "#FF3F33" "#FFE6E1" "#075B5E" "#9FC87E" # red peach green 

  # set_icons "" "" "" "" "" "" "" "" "" # use "" if don't want icon and seperator
  # set_icons "" "" " " " " " " " " " " "󰸗 " " " " "
  # set_icons "" "" " " " " " " " " " " "󰸗 " " " " "
  # set_icons "" "" "󱃸 " " " "󱪳 " " " "󱎫 " "󰸘 " "MEM:" "CPU:"
  # set_icons "" "" " " "󱚟 " "󰠡 " "󰣉 " "󱦟 " "󰸗 " "󰰐 " "󰯲 "
  # set_icons "" "" " " " " " " " " " " "󰸗 " " " " "
  # set_icons "" "" "󰥱 " "󰙄 " "󰪟 " "󰀨 " "󱑁 " "󰸗 " "󰰐 " "󰯲 "
  # set_icons " " " " " " "󰙊 " "󰠡 " " " " " "󰸗 " " " " "
  # set_icons " " "" "󱠇" "󰙊 " " " "󱓞 " "󰚱 " "󰸗 " " " " "

  set_color "default" "#16610E" "#F97A00" "#FED16A" "#FFF4A4" # green orange
  set_icons "" "" " " " " " " " " " " "󰸗 " " " " "

  status_left
  status_center
  status_right

  tmux set -g pane-active-border-style "fg=$color1"
}

main "$@"
