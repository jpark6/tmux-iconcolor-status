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
prev_icon=" "
time_icon=" "
date_icon="󰸗 "
mem_icon=" "
cpu_icon=" "

set_colors() {
  colors_string="$(echo ${@} | tr -d ' ')"
  IFS=',' read -ra colors_array <<< "$colors_string"

  if [[ ${colors_array[0]} = 'light' || ${colors_array[0]} = 'white' ]]; then
    bg_c="white"
  elif [[ ${colors_array[0]} = 'dark' || ${1} = 'black' ]]; then
    bg_c="black"
  elif [[ ${colors_array[0]} = 'default' ]]; then
    bg_c="default"
  else
    bg_c="${1//\"/}"
  fi

  c1="${colors_array[1]}"
  c2="${colors_array[2]}"
  c3="${colors_array[3]}"
}

set_separators() {
  separators_string=$@
  IFS=',' read -ra separators_array <<< "$separators_string"

  section_l_icon="${separators_array[0]}"
  section_r_icon="${separators_array[1]}"
  sp_l_icon="${separators_array[2]}"
  sp_r_icon="${separators_array[3]}"

}
set_icons() {
  icons_string=$@
  IFS=',' read -ra icons_array <<< "$icons_string"

  session_icon="${icons_array[0]}"
  user_icon="${icons_array[1]}"
  pane_icon="${icons_array[2]}"
  curr_icon="${icons_array[3]}"
  prev_icon="${icons_array[4]}"
  time_icon="${icons_array[5]}"
  date_icon="${icons_array[6]}"
  mem_icon="${icons_array[7]}"
  cpu_icon="${icons_array[8]}"
}

set_status_left() {
  # session / user / pane /
  tmux set -g status-left "#[fg=$c2,bg=$c1] $session_icon#S #[fg=$c1,bg=$c2]$section_r_icon#[fg=$c1,bg=$c2] $user_icon#[bold,italics]#(whoami) #[default]#[fg=$c2,bg=$c3]$section_r_icon#[fg=$c1,bg=$c3] $pane_icon#{window_index}:#{pane_index} #[fg=$c3,bg=$bg_c]$section_r_icon "
  # session / pane /
  # tmux set -g status-left "#[fg=$c2,bg=$c1] $session_icon#S #[fg=$c1,bg=$c2]$section_r_icon $pane_icon#{window_index}:#{pane_index} #[fg=$c2,bg=$bg_c]$section_r_icon"
  tmux set -g status-left-length 200
}

set_status_center() {
  tmux set -g status-style "fg=$c1,bg=$bg_c"

  tmux set -g status-justify centre # centre left right
  tmux set -g window-status-format "#[fg=$c1,bg=$bg_c] #(printf "%%s" #F | sed 's|-|$prev_icon|')#I #W "
  tmux set -g window-status-current-format "#[fg=$c1,bg=$bg_c]$section_l_icon#[fg=$c2,bg=$c1,bold] $curr_icon#[italics]#I $sp_r_icon#W #[default]#[fg=$c1,bg=$bg_c]$section_r_icon"
  tmux set -g window-status-separator " "
}

set_status_right() {
  tmux set -g status-right "#[fg=$c3,bg=$bg_c,align=right]$section_l_icon#[fg=$c1,bg=$c3] $time_icon%H:%M:%S #[fg=$c2,bg=$c3]$section_l_icon#[fg=$c1,bg=$c2] $date_icon%y/%m/%d #[fg=$c1,bg=$c2]$section_l_icon#[fg=$c2,bg=$c1] $mem_icon#(tmux-mem-cpu-load -m 2 -g 0 -a 0 -i 1 | sed 's|  | $sp_l_icon$cpu_icon|g') #[default]"
  # tmux set -g status-right "#{battery_icon}#{battery_percentage}"
  tmux set -g status-right-length 200
  tmux set -g status-interval 1
}

main() {
  global_colors=$(tmux show -gqv @tmux-status-colors 2>/dev/null)
  if [ -n "$global_colors" ]; then 
    set_colors $global_colors
  fi

  global_separators=$(tmux show -gqv @tmux-status-separators 2>/dev/null)
  if [ -n "$global_separators" ]; then 
    set_separators $global_separators
  fi

  global_icons=$(tmux show -gqv @tmux-status-icons 2>/dev/null)
  if [ -n "$global_icons" ]; then 
    set_icons "$global_icons"
  fi

  # Examples of colors / separators / icons
  # color references : https://colorhunt.co/
  # set_colors "," # no colors - bg: transparent fg : theme main color
  # set_colors "default,#16610E,#F97A00,#FED16A" # Forest - green orange yellow
  # set_colors "default,#626F47,#A4B465,#F5ECD5" # OliveGray - olive gray white
  # set_colors "default,#541690,#FF4949,#FFCD38" # Cyberpunk - purple pink orange
  # set_colors "default,#050C9C,#3572EF,#3ABEF9" # Ocean - blue lightpurple skyblue
  # set_colors "default,#FCC737,#F27B0F,#7E1891" # NeonYellow - yellow orange purple
  # set_colors "default,#952F7C,#45CC38,#CAAC00" # NeonPurple
  # set_colors "default,#EFE4D2,#254D70,#2F80BF" # WhiteGreen - white green blue
  # set_colors "default,#96624C,#CC8A6A,#FABB85" # Coffee
  # set_colors "default,#139E74,#BAFFE5,#E2FFF4" # Mint
  # set_colors "default,#A62C2C,#E83F25,#EA7300" # Flame - red orange yellow 
  # set_colors "default,#88C0D0,#2E3440,#FFFFFF" # Nord - skyblue darkgray white
  # set_colors "default,#0A0047,#00FFD2,#FF4499" # TokyoNight - darkblue teal pink
  # set_colors "default,#1A5319,#80AF81,#D6EFD8" # GradientGreen - gree dark → light
  # set_colors "default,#AA60C8,#D69ADE,#FFDFEF" # GradientPurple
  # set_colors "default,#3D90D7,#7AC6D2,#B5FCCD" # GradientBlue
  # set_colors "default,#FA812F,#F3C623,#FEF3E2" # GradientOrange - orange dark → light
  # set_colors "default,#4B352A,#CA7842,#B2CD9C" # PastelBrown -  brown yellow
  # set_colors "default,#B1AFFF,#FDFDBD,#C8FFD4" # PastelPurple - purple ivory skyblue
  # set_colors "default,#FD8A8A,#F1F7B5,#A8D1D1" # PastelPink - pink yellow blue
  # set_colors "default,#00809D,#FCECDD,#FF7601" # PastelCyan - cyan white orange
  # set_colors "default,#5EABD6,#FEFBC7,#FFB4B4" # PastlCyan2 - more bright
  # set_colors "default,#FF4F33,#FFE6E1,#075B5E" # PastelPeach red peach green 
  # set_colors "default,#005DFA,#8CB2F1,#D0CEDD" # Cold - blue skyblue white

  # separators and icon references : https://www.nerdfonts.com/cheat-sheet
  # set_separators "," # no saparators
  # set_separators ",,｜,｜,"
  # set_separators ",,,,"
  # set_separators ",, , ,"
  # set_separators ",, , ,"
  # set_separators ",,,,"
  # set_separators ",, , ,"
  # set_separators ",, , ,"
  # set_separators ",, , ,"
  # set_separators ",, , ,"
  # set_separators ",, , ,"
  # set_separators ",, , ,"
  # set_separators ",, , ,"
  # set_separators ",, , ,"
  # set_separators ",, , ,"
  # set_separators ",, , ,"
  # set_separators " ,,｜,｜,"
  # set_separators " ,, , ,"
  # set_separators " , ,｜,｜,"

  # set_icons "," # no icons
  # set_icons "󰒋 ,󱟄, ,  ,󰄬 ,󱦟 ,󰸗 , , ,"
  # set_icons "󰒋 ,󱟄, ,  , ,󱦟 ,󰸗 , , ,"
  # set_icons "󰹕 ,󰶪 ,󰃥 , 󰙏 ,󰸕 ,󱫍 , ,i, ,"  # study
  # set_icons "󰠴 ,󰑮 ,󱉾  ,  ,󰦶 ,󰔛 , , , ,"  # sport
  # set_icons "🖥 ,🤖 ,🪟 ,🎯,✨,⏳️,📅, , ,"
  # set_icons " , ,󰙄 ,󰣉 ,󰆤,󱎫 ,󰸘 , , ,"  # icon / no sep
  # set_icons "🧱,👷,🪟 ,🏗 ,🚧,⏳️,📅, ,,,"
  # set_icons "🌃,😪,🪟 ,🌙,💤,⏳️,📅, ,,,"
  # set_icons "🎹,🕺,🥁,🎸,🎶,🕰 ,📆,󰰐 ,󰯲 ,"
  # set_icons "🏟 ,🏊,🏓,⚽ ,🥅,⏳️,📆,󰰐 ,󰯲 ,"
  # set_icons "🏔 ,⛄,🚠 ,🏂 ,🍧,⌚️,🎄,󰰐 ,󰯲 ,"
  # set_icons " , , , , , ,󰸗 , , ,"
  # set_icons " , , ,󰎇 ,󰽺 , ,󰸗 , , ,"
  # set_icons "󰒋 ,󰙌, , , , ,󰸗 , , ,"
  # set_icons " , , ,󱝂 , , ,󰸗 , , ,"
  # set_icons "󰒋 , ,󱪳 ,󰠳 , ,󱎫 ,󰸘 ,M:,C:,"
  # set_icons "󱃸 , ,󱪳 ,󰠳 , ,󱎫 ,󰸘 ,M:,C:,"
  # set_icons " ,󱗌 ,󰕮 ,󰖙 , ,󱎫 ,󰸘 ,󰰐 ,󰯲 ,"
  # set_icons "  ,󰙄 ,󱪳 , , ,󱎫 ,󰸘 ,󰰐 ,󰯲 ,"
  # set_icons " ,󱚟 ,󰠡 ,󰣉 , ,󱦟 ,󰸗 ,󰰐 ,󰯲 ,"
  # set_icons " , , , , , ,󰸗 , , ,"
  # set_icons "󰥱 ,󰙄 ,󰪟 ,󰀨 , ,󱑁 ,󰸗 ,󰰐 ,󰯲 ,"
  # set_icons " ,󱎂 ,󰠡 ,󱝆 ,󱁕,󰄉 ,󰸗 , , ,"
  # set_icons "󰞍 ,󱝆 ,󱢋 ,󱢴 ,󱁕 ,󰄉 ,󰸗 , , ,"
  # set_icons "󱠇 ,󰙊 , ,󱓞 , ,󱦟 ,󰸗 , , ,"
  # set_icons "󰕲 ,󰙄 , ,󰣉 , ,󱦟 ,󰸗 , , ,"
  
  set_status_left
  set_status_center
  set_status_right

  tmux set -g pane-active-border-style "fg=$c1"
}

main "$@"
