#!/usr/bin/env bash

main() {
  local current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  source "$current_dir/scripts/set_colors_separators_icons.sh"
  source "$current_dir/scripts/set_theme.sh"
  source "$current_dir/scripts/set_status.sh"

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
