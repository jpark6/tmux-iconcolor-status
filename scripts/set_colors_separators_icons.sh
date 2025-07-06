#!/usr/bin/env bash

set_colors() {
  local colors_string="$(echo ${@} | tr -d ' ')"
  IFS=',' read -ra colors_array <<< "$colors_string"
  echo "$colors_string"

  c1="${colors_array[0]:-"default"}"
  c2="${colors_array[1]:-"none"}"
  c3="${colors_array[2]:-"default"}"

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
  local separators_string="$@"
  IFS=',' read -ra separators_array <<< "$separators_string"

  section_l_icon="${separators_array[0]}"
  section_r_icon="${separators_array[1]}"
  sp_l_icon="${separators_array[2]}"
  sp_r_icon="${separators_array[3]}"

}
set_icons() {
  icons_string="$@"
  IFS=',' read -ra icons_array <<< "$icons_string"

  session_icon="${icons_array[0]}"
  user_icon="${icons_array[1]}"
  pane_icon="${icons_array[2]}"
  curr_icon="${icons_array[3]}"
  last_icon="${icons_array[4]}"
  zoom_icon="${icons_array[5]}"
  time_icon="${icons_array[6]}"
  date_icon="${icons_array[7]}"
  cpu_icon="${icons_array[8]:-"󰯲 "}"
  mem_icon="${icons_array[9]:-"󰰐 "}"
  batt_charged_icon="${icons_array[10]:-" "}"
  batt_discharged_icon="${icons_array[11]:-"󰁾 "}"
  batt_charging_icon="${icons_array[12]:-"󰢝 "}"
}
