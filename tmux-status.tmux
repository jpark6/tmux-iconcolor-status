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
curr_icon=" "
prev_icon=" "
time_icon=" "
date_icon="󰸗 "
mem_icon=" "
cpu_icon=" "

set_color() {
  if [[ ${1} = 'light' || ${1} = 'white' ]]; then
    bg_c="white"
  elif [[ ${1} = 'dark' || ${1} = 'black' ]]; then
    bg_c="black"
  elif [[ ${1} = 'default' ]]; then
    bg_c="default"
  else
    bg_c=${1}
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
  prev_icon="${9}"
  time_icon="${10}"
  date_icon="${11}"
  mem_icon="${12}"
  cpu_icon="${13}"
}

status_left() {
  # session / user / pane /
  tmux set -g status-left "#[fg=$c2,bg=$c1] $session_icon#S #[fg=$c1,bg=$c2]$section_r_icon#[fg=$c1,bg=$c2] $user_icon#[bold,italics]#(whoami) #[default]#[fg=$c2,bg=$c3]$section_r_icon#[fg=$c1,bg=$c3] $pane_icon#{window_index}:#{pane_index} #[fg=$c3,bg=$bg_c]$section_r_icon"
  # session / pane /
  # tmux set -g status-left "#[fg=$c2,bg=$c1] $session_icon#S #[fg=$c1,bg=$c2]$section_r_icon $pane_icon#{window_index}:#{pane_index} #[fg=$c2,bg=$bg_c]$section_r_icon"
  tmux set -g status-left-length 200
}

status_center() {
  tmux set -g status-style "fg=$c1,bg=$bg_c"

  tmux set -g status-justify left # centre left right
  tmux set -g window-status-format "#[fg=$c2,bg=$bg_c] #(printf "%%s" #F | sed 's|-|$prev_icon|')#I #W "
  tmux set -g window-status-current-format "#[fg=$c1,bg=$bg_c]$section_l_icon#[fg=$c2,bg=$c1,bold] $curr_icon#[italics]#I $sp_r_icon#W #[default]#[fg=$c1,bg=$bg_c]$section_r_icon"
  tmux set -g window-status-separator " "
}

status_right() {
  tmux set -g status-right "#[fg=$c3,bg=$bg_c,align=right]$section_l_icon#[fg=$c1,bg=$c3] $time_icon%H:%M:%S #[fg=$c2,bg=$c3]$section_l_icon#[fg=$c1,bg=$c2] $date_icon%y/%m/%d #[fg=$c1,bg=$c2]$section_l_icon#[fg=$c2,bg=$c1] $mem_icon#(tmux-mem-cpu-load -m 2 -g 0 -a 0 -i 1 | sed 's|  | $sp_l_icon$cpu_icon |g') #[default]"
  tmux set -g status-right-length 200
  tmux set -g status-interval 1
}

main() {
  # color references : https://colorhunt.co/
  # set_color "default" "#16610E" "#F97A00" "#FED16A" # Forest - green orange yellow
  # set_color "dark"    "#626F47" "#A4B465" "#F5ECD5" # OliveGray - olive gray white
  # set_color "default" "#541690" "#FF4949" "#FFCD38" # Cyberpunk - purple pink orange
  # set_color "default" "#050C9C" "#3572EF" "#3ABEF9" # Ocean - blue lightpurple skyblue
  # set_color "default" "#FCC737" "#F26B0F" "#7E1891" # NeonYellow - yellow orange purple
  # set_color "default" "#952F7C" "#45CC38" "#CAAC00" # NeonPurple
  # set_color "default" "#EFE4D2" "#254D70" "#2F80BF" # WhiteGreen - white green blue
  # set_color "default" "#96624C" "#CC8A6A" "#FABB85" # Coffee
  # set_color "default" "#139E74" "#E2FFF4" "#BAFFE5" # Mint
  # set_color "default" "#A62C2C" "#E83F25" "#EA7300" # Flame - red orange yellow 
  # set_color "default" "#88C0D0" "#2E3440" "#FFFFFF" # Nord - skyblue darkgray white
  # set_color "default" "#0A0047" "#00FFD2" "#FF4499" # TokyoNight - darkblue teal pink
  # set_color "default" "#1A5319" "#80AF81" "#D6EFD8" # GradientGreen - gree dark → light
  # set_color "default" "cyan" "yellow" "white"  # PastelGreen cyan yellowgreen white
  # set_color "dark"    "#4B352A" "#CA7842" "#B2CD9C" # PastelBrown -  brown yellow
  # set_color "default" "#B1AFFF" "#FDFDBD" "#C8FFD4" # PastelPurple - purple ivory skyblue
  # set_color "default" "#FD8A8A" "#F1F7B5" "#A8D1D1" # PastelPink - pink yellow blue
  # set_color "default" "#00809D" "#FCECDD" "#FF7601" # PastelCyan - cyan white orange
  # set_color "default" "#FF3F33" "#FFE6E1" "#075B5E" # PastelPeach red peach green 
  # set_color "light"   "#005DFA" "#8CB2F1" "#D0CEDD" # Cold - blue skyblue white

  # set_icons "" "" "" "" "" "" "" " " "" "" "" "" "" # no icon and seperator
  # set_icons "" "" "" "" "󰒋 " "󱟄" " " "  " "󰄬 " "󱦟 " "󰸗 " " " " "
  # set_icons "" "" "" "" "󰒋 " "󱟄" " " "  " " " "󱦟 " "󰸗 " " " " "
  # set_icons "" "" "" "" " " "" " " " 󰣉 " "󰆤" "󱎫 " "󰸘 " " " " "  # icon / no sep
  # set_icons "" "" "" "" "󰹕 " "󰶪 " "󰃥 " " 󰙏 " "󰸕 " "󱫍 " " " "" ""  # study
  # set_icons "" "" "" "" "󰠴 " "󰑮 " "󱉾  " "  " "󰦶 " "󰔛 " " " "" ""  # sport
  # set_icons "" "" "" "" "🖥 " "🤖 " "🪟 " "🎯" "✨" "⏳️" "📅" " " "" 
  # set_icons "" "" "" "" "🧱" "👷" "🪟 " "🏗 " "🚧" "⏳️" "📅" " " "" 
  # set_icons "" "" "" "" "🌃" "😪" "🪟 " "🌙" "💤" "⏳️" "📅" " " "" 
  # set_icons "" "" " " " " "🎹" "🕺" "🥁" "🎸" "🎶" "🕰 " "📆" "󰰐 " "󰯲 "
  # set_icons "" "" " " " " "🏟 " "🏊" "🏓" "⚽ " "🥅" "⏳️" "📆" "󰰐 " "󰯲 "
  # set_icons "" "" "" "" "🏔 " "" "🚠 " "🏂 " "🍧" "⌚️" "🎄" "󰰐 " "󰯲 "
  # set_icons "" "" " " " " " " " " " " " " " " " " "󰸗 " " " " "
  # set_icons "" "" " " " " " " " " " " "󰎇 " "󰽺 " " " "󰸗 " " " " "
  # set_icons "" "" " " " " "󰒋 " "󰙌" " " " " " " " " "󰸗 " " " " "
  # set_icons "" "" " " " " " " " " " " "󱝂 " " " " " "󰸗 " " " " "
  # set_icons "" "" " " " " "󱃸 " " " "󱪳 " "󰠳 " " " "󱎫 " "󰸘 " "MEM:" "CPU:"
  # set_icons "" "" " " " " "󱃸 " " " "󱪳 " "󰠳 " " " "󱎫 " "󰸘 " "M:" "C:"
  # set_icons "" "" " " " " " " "󱗌 " "󰕮 " "󰖙 " " " "󱎫 " "󰸘 " "󰰐 " "󰯲 "
  # set_icons "" "" " " " " "  " "󰙄 " "󱪳 " " " " " "󱎫 " "󰸘 " "󰰐 " "󰯲 "
  # set_icons "" "" " " " " " " "󱚟 " "󰠡 " "󰣉 " " " "󱦟 " "󰸗 " "󰰐 " "󰯲 "
  # set_icons "" "" " " " " " " " " " " " " " " " " "󰸗 " " " " "
  # set_icons "" "" " " " " "󰥱 " "󰙄 " "󰪟 " "󰀨 " " " "󱑁 " "󰸗 " "󰰐 " "󰯲 "
  # set_icons " " "" "｜" "｜" " " "󱎂 " "󰠡 " "󱝆 " "󱁕" "󰄉 " "󰸗 " " " " "
  # set_icons " " "" "" "" "󰞍 " "󱝆 " "󱢋 " "󱢴 " "󱁕 " "󰄉 " "󰸗 " " " " "
  # set_icons " " "" " " " " "󱠇 " "󰙊 " " " "󱓞 " " " "󱦟 " "󰸗 " " " " "
  # set_icons " " " " "｜" "｜" "󰕲 " "󰙄 " " " "󰣉 " " " "󱦟 " "󰸗 " "" ""

  set_color "default" "#16610E" "#F97A00" "#FED16A" # Forest - green orange yellow
  set_icons "" "" " " " " " " " " " " " " " " " " "󰸗 " " " " "

  status_left
  status_center
  status_right

  tmux set -g pane-active-border-style "fg=$c1"
}

main "$@"
