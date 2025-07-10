#!/usr/bin/env bash
#
set_theme() {
  theme_string="$(echo ${@} | tr -d ' ')"
  IFS=',' read -ra theme_array <<< "$theme_string"

  local color="$(echo ${theme_array[0]:-"default"} | tr '[:upper:]' '[:lower:]')"
  local separator="$(echo ${theme_array[1]:-""} | tr '[:upper:]' '[:lower:]')"
  local icon="$(echo ${theme_array[2]:-"default"} | tr '[:upper:]' '[:lower:]')"

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
    flame)
      separators=" , , , ,"
      ;;
    pixel)
      separators=" , ,┃,┃,"
      ;;
    round)
      separators=",,,,"
      ;;
    slant-down)
      separators=",,,"
      ;;
    slant-left)
      separators=",,,"
      ;;
    slant-up)
      separators=",,,"
      ;;
    slant|slant-right)
      separators=",,,"
      ;;
    triangle-inverse)
      separators=",,,"
      ;;
    triangle-left)
      separators=",,,"
      ;;
    triangle-right)
      separators=",,,"
      ;;
    triangle|triangle-both)
      separators=",,,"
      ;;
    wave)
      separators=" , ,┃,┃,"
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
    surf-emoji)
      icons="🏖️ ,🧜,🛳 ,🏄,🍧,🔍,⏳️,🌴,󰯲 ,󰰐 ,󱐥 ,󰁾 ,󰢝 ,"
      ;;
    target-emoji)
      icons="🖥 ,🤖 ,🪟 ,🎯,✨,🔍,🕐,📅, , ,⚡️,🪫,🔋,"
      ;;
    winter-emoji)
      icons="🏔 ,⛄,🚠 ,🏂,🧤,🔍,🕘,🎄,󰯲 ,󰰐 ,🔌,🪫,🔋,"
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
      icons="󰒋 , ,󱪳 ,󰠳 , , ,󱎫 ,󰸘 ,C:,M:, ,󰁾 ,󰢝 ,"
      ;;
    study)
      icons="󰹕 ,󰶪 ,󰃥 , 󰙏 ,󰸕 , ,󱫍 , , ,i, ,󰁾 ,󰢝 ,"
      ;;
    sun)
      icons=" ,󱗌 ,󰕮 ,󰖙 , , ,󱎫 ,󰸘 ,󰯲 ,󰰐 , ,󰁾 ,󰢝 ,"
      ;;
    surf)
      icons=" ,󱎂 ,󰕮 ,󱝆 ,󱁕, ,󰄉 ,󰸗 , , , ,󰁾 ,󰢝 ,"
      ;;
    target)
      icons="󰕲 ,󰙄 , ,󰣉 , , ,󱦟 ,󰸗 , , , ,󰁾 ,󰢝 ,"
      ;;
    wave)
      icons="󰞍 ,󱝆 ,󱢋 ,󱢴 ,󱁕 , ,󰄉 ,󰸗 , , , ,󰁾 ,󰢝 ,"
      ;;
    winter)
      icons=" , ,󰶛 , , , ,󰔛 , ,󰯲 ,󰰐 , ,󰁾 ,󰢝 ,"
      ;;
    *)
      icons=""
      ;;
  esac
  set_icons "$icons"
}
