#!/usr/bin/env sh

bg_c="default" # statusbar bg color
c1="#16610E" # session & MEM CPU bg color
c2="#F97A00" # username & date bg color
c3="#FED16A" # pane & time bg color

section_l_icon=""
section_r_icon=""
sp_l_icon=""
sp_r_icon=""
session_icon=" "
user_icon=" "
pane_icon=" "
curr_icon=" "
time_icon=" "
date_icon="󰸗 "
mem_icon=" "
cpu_icon=" "

set_color() {
  if [[ ${1} = 'light' || ${1} = 'white' ]]; then
    bg_c="white"
  elif [[ ${1} = 'dark' || ${1} = 'black' ]]; then
    bg_c="black"
  else
    bg_c="default"
  fi

  c1="${2}"
  c2="${3}"
  c3="${4}"
}

set_icons() {
  section_l_icon="${1}"
  section_r_icon="${2}"
  sp_l_icon="${3}"
  sp_r_icon="${4}"
  session_icon="${5}"
  user_icon="${6}"
  pane_icon="${7}"
  curr_icon="${8}"
  time_icon="${9}"
  date_icon="${10}"
  mem_icon="${11}"
  cpu_icon="${12}"
}

status_left() {
  # session / user / pane /
  tmux set -g status-left "#[fg=$c2,bg=$c1] $session_icon#S #[fg=$c1,bg=$c2]$section_r_icon #[bold,italics]$user_icon#(whoami) #[default]#[fg=$c2,bg=$c3]$section_r_icon#[fg=$c1,bg=$c3] $pane_icon#{window_index}:#{pane_index} #[fg=$c3,bg=$bg_c]$section_r_icon"
  # session / pane /
  # tmux set -g status-left "#[fg=$c2,bg=$c1] $session_icon#S #[fg=$c1,bg=$c2]$section_r_icon $pane_icon#{window_index}:#{pane_index} #[fg=$c2,bg=$bg_c]$section_r_icon"
  tmux set -g status-left-length 200
}

status_center() {
  tmux set -g status-style "fg=$c1,bg=$bg_c"

  tmux set -g status-justify centre # centre left right
  tmux set -g window-status-format "#[fg=$c1,bg=$bg_c] #I$sp_r_icon#W "
  tmux set -g window-status-current-format "#[fg=$c1,bg=$bg_c]$section_l_icon#[fg=$c3,bg=$c1,bold] $curr_icon#I$sp_r_icon#W #[default]#[fg=$c1,bg=$bg_c]$section_r_icon"
  tmux set -g window-status-separator " "
}

status_right() {
  tmux set -g status-right "#[fg=$c3,bg=$bg_c]$section_l_icon#[fg=$c1,bg=$c3] $time_icon%H:%M:%S #[fg=$c2,bg=$c3]$section_l_icon#[fg=$c1,bg=$c2] $date_icon%y/%m/%d #[fg=$c1,bg=$c2]$section_l_icon#[fg=$c2,bg=$c1] $mem_icon #(tmux-mem-cpu-load -m 2 -g 0 -a 0 -i 1 | sed 's|  | $sp_l_icon$cpu_icon |g') #[default]"
  tmux set -g status-right-length 200
  tmux set -g status-interval 1
}

main() {
  # color references : https://colorhunt.co/
  # set_color "default" "#16610E" "#F97A00" "#FED16A"  # green orange
  # set_color "dark" "#626F47" "#A4B465" "#F5ECD5"  # gray olive
  # set_color "default" "#11009E" "#4942E4" "#8696FE"  # cold - navy blue purple
  # set_color "default" "#541690" "#FF4949" "#FFCD38"  # cyberpunk - purple pink orange
  # set_color "" "#11009E" "#4942E4" "#8696FE"  # cold - navy blue white
  # set_color "default" "#050C9C" "#3572EF" "#3ABEF9"  # ice - blue lightpurple skyblu
  # set_color "default" "#4B352A" "#CA7842" "#B2CD9C"  # brown yellow
  # set_color default teal yellowgreen cyan yellow # Neon
  # set_color "default" "#FF3F33" "#FFE6E1" "#075B5E"  # red peach green 
  # set_color "default" "#FCC737" "#F26B0F" "#7E1891"  # yellow orange purple
  # set_color "default" "#EFE4D2" "#254D70" "#131D4F"  # white green orange
  # set_color "default" "#A62C2C" "#E83F25" "#EA7300"  # flame red orange yellow 
  # set_color "deafult" "#88C0D0" "#2E3440" "#FFFFFF" # Nord
  # set_color "deafult" "#00809D" "#FCECDD" "#FF7601" # Cyan white orange

  # set_icons "" "" "" "" "" "" "" "" "" "" "" "" # use "" if don't want icon and seperator
  # set_icons "" "" "｜" "｜" " " "" " " "󰣉 " "󱎫 " "󰸘 " " " " "  # no seperator but use icon
  # set_icons "" "" "" "" " " " " " " " " " " "󰸗 " " " " "
  # set_icons "" "" "" "" " " " " " " " " " " "󰸗 " " " " "
  # set_icons "" "" "" "" " " " " " " " " " " "󰸗 " " " " "
  # set_icons "" "" "" "" " " " " " " " " " " "󰸗 " " " " "
  # set_icons "" "" "  " "  " "󱃸 " " " "󱪳 " " " "󱎫 " "󰸘 " "MEM:" "CPU:"
  # set_icons "" "" "" "" " " "󱚟 " "󰠡 " "󰣉 " "󱦟 " "󰸗 " "󰰐 " "󰯲 "
  # set_icons "" "" "" "" " " " " " " " " " " "󰸗 " " " " "
  # set_icons "" "" "" "" "󰥱 " "󰙄 " "󰪟 " "󰀨 " "󱑁 " "󰸗 " "󰰐 " "󰯲 "
  # set_icons " " "" "|" "|" " " "󱎂 " "󰠡 " "󱝆 " "󰚱 " "󰸗 " " " " "
  # set_icons " " "" " " " " "󱠇 " "󰙊 " " " "󱓞 " "󱦟 " "󰸗 " " " " "
  # set_icons " " " " "|" "|" " " "󰙄 " "󰠡 " "󰣉 " "󱦟 " "󰸗 " "" ""

  set_color "default" "#16610E" "#F97A00" "#FED16A"  # green orange
  set_icons "" "" "" "" " " " " " " " " " " "󰸗 " " " " "

  status_left
  status_center
  status_right

  tmux set -g pane-active-border-style "fg=$c1"
}

main "$@"
