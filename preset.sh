#!/usr/bin/env bash

preset() {
  # Examples of colors / separators / icons
  # color references : https://colorhunt.co/
  set -g @tmux-status-colors "," # no colors - bg: transparent fg : theme main color
  set -g @tmux-status-colors "default,#16610E,#F97A00,#FED16A" # Forest - green orange yellow
  set -g @tmux-status-colors "default,#626F47,#A4B465,#F5ECD5" # OliveGray - olive gray white
  set -g @tmux-status-colors "default,#541690,#FF4949,#FFCD38" # Cyberpunk - purple pink orange
  set -g @tmux-status-colors "default,#050C9C,#3572EF,#3ABEF9" # Ocean - blue lightpurple skyblue
  set -g @tmux-status-colors "default,#FCC737,#F27B0F,#7E1891" # NeonYellow - yellow orange purple
  set -g @tmux-status-colors "default,#952F7C,#45CC38,#CAAC00" # NeonPurple
  set -g @tmux-status-colors "default,#EFE4D2,#254D70,#2F80BF" # WhiteGreen - white green blue
  set -g @tmux-status-colors "default,#96624C,#CC8A6A,#FABB85" # Coffee
  set -g @tmux-status-colors "default,#139E74,#BAFFE5,#E2FFF4" # Mint
  set -g @tmux-status-colors "default,#A62C2C,#E83F25,#EA7300" # Flame - red orange yellow 
  set -g @tmux-status-colors "default,#88C0D0,#2E3440,#FFFFFF" # Nord - skyblue darkgray white
  set -g @tmux-status-colors "default,#0A0047,#00FFD2,#FF4499" # TokyoNight - darkblue teal pink
  set -g @tmux-status-colors "default,#1A5319,#80AF81,#D6EFD8" # GradientGreen - gree dark → light
  set -g @tmux-status-colors "default,#AA60C8,#D69ADE,#FFDFEF" # GradientPurple
  set -g @tmux-status-colors "default,#3D90D7,#7AC6D2,#B5FCCD" # GradientBlue
  set -g @tmux-status-colors "default,#FA812F,#F3C623,#FEF3E2" # GradientOrange - orange dark → light
  set -g @tmux-status-colors "default,#4B352A,#CA7842,#B2CD9C" # PastelBrown -  brown yellow
  set -g @tmux-status-colors "default,#B1AFFF,#FDFDBD,#C8FFD4" # PastelPurple - purple ivory skyblue
  set -g @tmux-status-colors "default,#FD8A8A,#F1F7B5,#A8D1D1" # PastelPink - pink yellow blue
  set -g @tmux-status-colors "default,#00809D,#FCECDD,#FF7601" # PastelCyan - cyan white orange
  set -g @tmux-status-colors "default,#5EABD6,#FEFBC7,#FFB4B4" # PastlCyan2 - more bright
  set -g @tmux-status-colors "default,#FF4F33,#FFE6E1,#075B5E" # PastelPeach red peach green 
  set -g @tmux-status-colors "default,#005DFA,#8CB2F1,#D0CEDD" # Cold - blue skyblue white

  # separators and icon references : https://www.nerdfonts.com/cheat-sheet
  set -g @tmux-status-separators "," # no saparators
  set -g @tmux-status-separators ",,┃,┃,"
  set -g @tmux-status-separators ",,,,"
  set -g @tmux-status-separators ",, , ," # round
  set -g @tmux-status-separators ",,,,"     # round 
  set -g @tmux-status-separators ",, , ," # slant right / /
  set -g @tmux-status-separators ",, , ," # slant left \ \
  set -g @tmux-status-separators ",, , ," # slant down / \
  set -g @tmux-status-separators ",, , ," # slant up \ /
  set -g @tmux-status-separators ",, , ," # triangle both < >
  set -g @tmux-status-separators ",, , ," # triangle left < <
  set -g @tmux-status-separators ",, , ," # triangle right > >
  set -g @tmux-status-separators ",, , ," # triangle inverse > <
  set -g @tmux-status-separators ",, , ," # trapezoid like > <
  set -g @tmux-status-separators " ,,┃,┃," # wave
  set -g @tmux-status-separators " ,, , ," # flame
  set -g @tmux-status-separators " , ,┃,┃," # pixel

  set -g @tmux-status-icons "," # no icons
  set -g @tmux-status-icons "🖥 ,🤖 ,🪟 ,🎯,✨,🔍,⏳️,📅, , ,⚡️,🪫,🔋," # target emoji
  set -g @tmux-status-icons "🧱,👷,🪟 ,🏗 ,🚧,🔍,⏳️,📅, , , ,󱊢 ,󱊥 ," # construction emoji
  set -g @tmux-status-icons "🌃,😪,🪟 ,🌙,💤,🔍,⏳️,📅,i, , ,󰁾 ,󰢝 ,"  # night emoji
  set -g @tmux-status-icons "🎹,🕺,🥁,🎸,🎶,🔍,🕰 ,📆,󰯲 ,󰰐 ,󰚥 , ,󰂄 ,"  # music emoji
  set -g @tmux-status-icons "🏟 ,🏊,🏓,⚽ ,🥅,🔍,⏳️,📆,󰯲 ,󰰐 , ,󰁾 ,󰢝 ," # sport emoji
  set -g @tmux-status-icons "🏔 ,⛄,🚠 ,🏂 ,🍧,🔍,⌚️,🎄,󰯲 ,󰰐 ,󱐥 ,󰁾 ,󰢝 ," # winter emoji
  set -g @tmux-status-icons " , ,󰙄 ,󰣉 ,󰆤, ,󱎫 ,󰸘 , , , ,󰁾 ,󰢝 ,"  # target
  set -g @tmux-status-icons "󰒋 ,󱟄, , ,󰄬 , ,󱦟 ,󰸗 , , , ,󱊢 ,󱊥 ," # ship
  set -g @tmux-status-icons "󰒋 ,󱟄, , , , ,󱦟 ,󰸗 , , , ,󰁾 ,󰢝 ," # play
  set -g @tmux-status-icons "󰹕 ,󰶪 ,󰃥 , 󰙏 ,󰸕 , ,󱫍 , , ,i, ,󰁾 ,󰢝 ,"  # study
  set -g @tmux-status-icons "󰠴 ,󰑮 ,󱉾  ,  ,󰦶 , ,󰔛 , , , ,󰚥 , ,󰂄 ,"  # sport
  set -g @tmux-status-icons " , , , , , , ,󰸗 , , , ,󰁾 ,󰢝 ," # curved arrow
  set -g @tmux-status-icons " , , ,󰎇 ,󰽺 , , ,󰸗 , , , ,󰁾 ,󰢝 ," # music
  set -g @tmux-status-icons "󰒋 ,󰙌, , , , , ,󰸗 , , , ,󰁾 ,󰢝 ," # biohazard
  set -g @tmux-status-icons " , , ,󱝂 , , , ,󰸗 , , , ,󰁾 ,󰢝 ," # star
  set -g @tmux-status-icons "󰒋 , ,󱪳 ,󰠳 , , ,󱎫 ,󰸘 ,C:,M:, ,󰁾 ,󰢝 ," # steering wheel
  set -g @tmux-status-icons "󱃸 , ,󱪳 ,󰠳 , , ,󱎫 ,󰸘 ,C:,M:, ,󰁾 ,󰢝 ," # steering wheel
  set -g @tmux-status-icons " ,󱗌 ,󰕮 ,󰖙 , , ,󱎫 ,󰸘 ,󰯲 ,󰰐 , ,󰁾 ,󰢝 ," # sun 
  set -g @tmux-status-icons "  ,󰙄 ,󱪳 , , , ,󱎫 ,󰸘 ,󰯲 ,󰰐 ,󰚥 , ,󰂄 ," # play round
  set -g @tmux-status-icons " ,󱚟 ,󰠡 ,󰣉 , , ,󱦟 ,󰸗 ,󰯲 ,󰰐 , ,󰁾 ,󰢝 ," # target
  set -g @tmux-status-icons " , , , , , , ,󰸗 , , , ,󰁾 ,󰢝 ," # play
  set -g @tmux-status-icons "󰥱 ,󰙄 ,󰪟 ,󰀨 , , ,󱑁 ,󰸗 ,󰯲 ,󰰐 , ,󰁾 ,󰢝 ," # important
  set -g @tmux-status-icons " ,󱎂 ,󰠡 ,󱝆 ,󱁕, ,󰄉 ,󰸗 , , , ,󰁾 ,󰢝 ," # surf
  set -g @tmux-status-icons "󰞍 ,󱝆 ,󱢋 ,󱢴 ,󱁕 , ,󰄉 ,󰸗 , , , ,󰁾 ,󰢝 ," # wave
  set -g @tmux-status-icons "󱠇 ,󰙊 , ,󱓞 , , ,󱦟 ,󰸗 , , , ,󰁾 ,󰢝 ," # hello
  set -g @tmux-status-icons "󰕲 ,󰙄 , ,󰣉 , , ,󱦟 ,󰸗 , , , ,󰁾 ,󰢝 ," # target
  set -g @tmux-status-icons " , ,󰶛 , , , ,󰔛 , ,󰯲 ,󰰐 , ,󰁾 ,󰢝 ," # winter emoji

  tmux set -g @tmux-status-show-user-name on
  tmux set -g @tmux-status-show-cpu-mem on
  tmux set -g @tmux-status-show-battery on
}

main() {
  # preset
}

main
