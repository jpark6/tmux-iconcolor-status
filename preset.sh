#!/usr/bin/env bash

preset() {
  # Examples of colors / separators / icons
  # color references : https://colorhunt.co/
  # colors : color1, color2, color3, background color
  set -g @iconcolor-colors "" # no colors - fg: terminal theme color, bg: transparent
  set -g @iconcolor-colors "#050C9C" # just set text color - fg: blue bg: transparent
  set -g @iconcolor-colors "#16610E,#F97A00,#FED16A,default" # Forest - green orange yellow
  set -g @iconcolor-colors "#626F47,#A4B465,#F5ECD5,default" # OliveGray - olive gray white
  set -g @iconcolor-colors "#541690,#FF4949,#FFCD38,default" # Cyberpunk - purple pink orange
  set -g @iconcolor-colors "#050C9C,#3572EF,#3ABEF9,default" # Ocean - blue lightpurple skyblue
  set -g @iconcolor-colors "#FCC737,#F27B0F,#7E1891,default" # NeonYellow - yellow orange purple
  set -g @iconcolor-colors "#952F7C,#45CC38,#CAAC00,default" # NeonPurple
  set -g @iconcolor-colors "#EFE4D2,#254D70,#2F80BF,default" # WhiteGreen - white green blue
  set -g @iconcolor-colors "#96624C,#CC8A6A,#FABB85,default" # Coffee
  set -g @iconcolor-colors "#139E74,#BAFFE5,#E2FFF4,default" # Mint
  set -g @iconcolor-colors "#A62C2C,#E83F25,#EA7300,default" # Flame - red orange yellow 
  set -g @iconcolor-colors "#88C0D0,#2E3440,#FFFFFF,default" # Nord - skyblue darkgray white
  set -g @iconcolor-colors "#0A0047,#00FFD2,#FF4499,default" # TokyoNight - darkblue teal pink
  set -g @iconcolor-colors "#1A5319,#80AF81,#D6EFD8,default" # GradientGreen - gree dark → light
  set -g @iconcolor-colors "#AA60C8,#D69ADE,#FFDFEF,default" # GradientPurple
  set -g @iconcolor-colors "#3D90D7,#7AC6D2,#B5FCCD,default" # GradientBlue
  set -g @iconcolor-colors "#FA812F,#F3C623,#FEF3E2,default" # GradientOrange - orange dark → light
  set -g @iconcolor-colors "#4B352A,#CA7842,#B2CD9C,default" # PastelBrown -  brown yellow
  set -g @iconcolor-colors "#B1AFFF,#FDFDBD,#C8FFD4,default" # PastelPurple - purple ivory skyblue
  set -g @iconcolor-colors "#FD8A8A,#F1F7B5,#A8D1D1,default" # PastelPink - pink yellow blue
  set -g @iconcolor-colors "#00809D,#FCECDD,#FF7601,default" # PastelCyan - cyan white orange
  set -g @iconcolor-colors "#5EABD6,#FEFBC7,#FFB4B4,default" # PastlCyan2 - more bright
  set -g @iconcolor-colors "#FF4F33,#FFE6E1,#075B5E,default" # PastelPeach red peach green 
  set -g @iconcolor-colors "#005DFA,#8CB2F1,#D0CEDD,default" # Cold - blue skyblue white

  # separators and icon references : https://www.nerdfonts.com/cheat-sheet
  # separators : section left, setion right,separator left, separator right
  set -g @iconcolor-separators "," # no saparators
  set -g @iconcolor-separators ",,┃,┃,"
  set -g @iconcolor-separators ",,,,"
  set -g @iconcolor-separators ",, , ," # round
  set -g @iconcolor-separators ",,,,"     # round 
  set -g @iconcolor-separators ",, , ," # slant right / /
  set -g @iconcolor-separators ",, , ," # slant left \ \
  set -g @iconcolor-separators ",, , ," # slant down / \
  set -g @iconcolor-separators ",, , ," # slant up \ /
  set -g @iconcolor-separators ",, , ," # triangle both < >
  set -g @iconcolor-separators ",, , ," # triangle left < <
  set -g @iconcolor-separators ",, , ," # triangle right > >
  set -g @iconcolor-separators ",, , ," # triangle inverse > <
  set -g @iconcolor-separators ",, , ," # trapezoid like > <
  set -g @iconcolor-separators " ,,┃,┃," # wave
  set -g @iconcolor-separators " ,, , ," # flame
  set -g @iconcolor-separators " , ,┃,┃," # pixel

  # icons : session, user, pane, current, last, zoom, time, date, cpu, mem, charged, uncharging, charing
  set -g @iconcolor-icons "," # no icons
  set -g @iconcolor-icons "🖥 ,🤖 ,🪟 ,🎯,✨,🔍,⏳️,📅, , ,⚡️,🪫,🔋," # target emoji
  set -g @iconcolor-icons "🧱,👷,🪟 ,🏗 ,🚧,🔍,⏳️,📅, , , ,󱊢 ,󱊥 ," # construction emoji
  set -g @iconcolor-icons "🌃,😪,🪟 ,🌙,💤,🔍,⏳️,📅,i, , ,󰁾 ,󰢝 ,"  # night emoji
  set -g @iconcolor-icons "🎹,🕺,🥁,🎸,🎶,🔍,🕰 ,📆,󰯲 ,󰰐 ,󰚥 , ,󰂄 ,"  # music emoji
  set -g @iconcolor-icons "🏟 ,🏊,🏓,⚽ ,🥅,🔍,⏳️,📆,󰯲 ,󰰐 , ,󰁾 ,󰢝 ," # sport emoji
  set -g @iconcolor-icons "🏔 ,⛄,🚠 ,🏂 ,🍧,🔍,⌚️,🎄,󰯲 ,󰰐 ,󱐥 ,󰁾 ,󰢝 ," # winter emoji
  set -g @iconcolor-icons " , ,󰙄 ,󰣉 ,󰆤, ,󱎫 ,󰸘 , , , ,󰁾 ,󰢝 ,"  # target
  set -g @iconcolor-icons "󰒋 ,󱟄, , ,󰄬 , ,󱦟 ,󰸗 , , , ,󱊢 ,󱊥 ," # ship
  set -g @iconcolor-icons "󰒋 ,󱟄, , , , ,󱦟 ,󰸗 , , , ,󰁾 ,󰢝 ," # play
  set -g @iconcolor-icons "󰹕 ,󰶪 ,󰃥 , 󰙏 ,󰸕 , ,󱫍 , , ,i, ,󰁾 ,󰢝 ,"  # study
  set -g @iconcolor-icons "󰠴 ,󰑮 ,󱉾  ,  ,󰦶 , ,󰔛 , , , ,󰚥 , ,󰂄 ,"  # sport
  set -g @iconcolor-icons " , , , , , , ,󰸗 , , , ,󰁾 ,󰢝 ," # curved arrow
  set -g @iconcolor-icons " , , ,󰎇 ,󰽺 , , ,󰸗 , , , ,󰁾 ,󰢝 ," # music
  set -g @iconcolor-icons "󰒋 ,󰙌, , , , , ,󰸗 , , , ,󰁾 ,󰢝 ," # biohazard
  set -g @iconcolor-icons " , , ,󱝂 , , , ,󰸗 , , , ,󰁾 ,󰢝 ," # star
  set -g @iconcolor-icons "󰒋 , ,󱪳 ,󰠳 , , ,󱎫 ,󰸘 ,C:,M:, ,󰁾 ,󰢝 ," # steering wheel
  set -g @iconcolor-icons "󱃸 , ,󱪳 ,󰠳 , , ,󱎫 ,󰸘 ,C:,M:, ,󰁾 ,󰢝 ," # steering wheel
  set -g @iconcolor-icons " ,󱗌 ,󰕮 ,󰖙 , , ,󱎫 ,󰸘 ,󰯲 ,󰰐 , ,󰁾 ,󰢝 ," # sun 
  set -g @iconcolor-icons "  ,󰙄 ,󱪳 , , , ,󱎫 ,󰸘 ,󰯲 ,󰰐 ,󰚥 , ,󰂄 ," # play round
  set -g @iconcolor-icons " ,󱚟 ,󰠡 ,󰣉 , , ,󱦟 ,󰸗 ,󰯲 ,󰰐 , ,󰁾 ,󰢝 ," # target
  set -g @iconcolor-icons " , , , , , , ,󰸗 , , , ,󰁾 ,󰢝 ," # play
  set -g @iconcolor-icons "󰥱 ,󰙄 ,󰪟 ,󰀨 , , ,󱑁 ,󰸗 ,󰯲 ,󰰐 , ,󰁾 ,󰢝 ," # important
  set -g @iconcolor-icons " ,󱎂 ,󰠡 ,󱝆 ,󱁕, ,󰄉 ,󰸗 , , , ,󰁾 ,󰢝 ," # surf
  set -g @iconcolor-icons "󰞍 ,󱝆 ,󱢋 ,󱢴 ,󱁕 , ,󰄉 ,󰸗 , , , ,󰁾 ,󰢝 ," # wave
  set -g @iconcolor-icons "󱠇 ,󰙊 , ,󱓞 , , ,󱦟 ,󰸗 , , , ,󰁾 ,󰢝 ," # hello
  set -g @iconcolor-icons "󰕲 ,󰙄 , ,󰣉 , , ,󱦟 ,󰸗 , , , ,󰁾 ,󰢝 ," # target
  set -g @iconcolor-icons " , ,󰶛 , , , ,󰔛 , ,󰯲 ,󰰐 , ,󰁾 ,󰢝 ," # winter emoji

  tmux set -g @iconcolor-show-user-name on
  tmux set -g @iconcolor-show-cpu-mem on
  tmux set -g @iconcolor-show-battery on
}

main() {
  # preset
}

main
