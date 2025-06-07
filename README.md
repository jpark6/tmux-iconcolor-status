# tmux-status

> `jpark6/tmux-status` is simple tmux status plugin

## Preinstall
### Nerd Font
[Nerd Font github page](https://github.com/ryanoasis/nerd-fonts)
Need to install the Nerd Font for the icons to display properly.

### plugins
if want to see mem/cpu usage percent  
install [thewtex/tmux-mem-cpu-load](https://github.com/thewtex/tmux-mem-cpu-load)


## Install
### Tmux Plugin Manager (TPM)

add in `~/.tmux.conf`
```shell
set -g @plugin 'jpark6/tmux-status'
```

### Manual
Clone this repository in your `$HOME/.tmux/` directory:

```shell
git clone https://github.com/jpark6/tmux-status.git $HOME/.tmux/plugins/tmux-status
```

add to  `.tmux.conf` file:

```shell
run $HOME/.tmux/plugins/tmux-status/tmux-status.tmux
```

## Usage
- change `tmux-status.tmux` and reload plugin
1. change `tmux-status.tmux` main function
```shell
main() {
  ...
  # change below 2 lines
  set_color "default" "#16610E" "#F97A00" "#FED16A" "#FFF4A4" # green orange
  set_icons "" "" " " " " " " " " " " "󰸗 " " " " "

  status_left
  status_center
  status_right

  tmux set -g pane-active-border-style "fg=$color1"
}

```
2. reload `tmux-status.tmux` login
  - Reload tmux
    - press \<prefix\>+I (default: \<C-b\>+I)
  - or run `tmux-status.tmux`
    - press \<prefix>+: and type `:run /path/to/plugin/tmux-status.tmux`
    - type command in shell: `tmux run /path/to/plugin/tmux-status.tmux`

### Default 
- default color if don't set colors & icons
- separator : /
- color: green orange yellow
```shell
status_bg_color="default" # statusbar background color default: terminal background / light / dark
color1="#16610E" # session & current windows background color
color2="#F97A00" # session & current windows foreground color
color3="#FED16A" # username background color
color4="#FFF4A4" # inactive windows background color

separator_start_icon=""
separator_end_icon=""
session_icon=" "
user_icon=" "
pane_icon=" "
status_current_icon=""
time_icon=" "
date_icon="󰸗 "
host_icon=" "
```
![./images/default.png](./images/default.png)

### Rounded Separators & Cyberfunk Color
```shell
  set_color "default" "#541690" "#FF4949" "#FF8D29" "#FFCD38" # cyberpunk - purple pink orange
  set_icons "" "" "󰥱 " "󰙄 " "󰪟 " "󰀨 " "󱑁 " "󰸗 " "󰰐 " "󰯲 "
```
![./images/round-cyberpunk.png](./images/round-cyberpunk.png)

### Wave Separators & Cold Color (status baground light)
```shell
  set_color "light" "#11009E" "#4942E4" "#8696FE" "#C4B0FF" # cold - navy blue people
  set_icons " " " " " " "󰙊 " "󰠡 " " " " " "󰸗 " " " " "
```
![./images/wave-cold.png](./images/wave-cold.png)

### Flame Separators & Red pearch Green
```shell
  set_color default "#FF3F33" "#FFE6E1" "#075B5E" "#9FC87E" # red peach green 
  set_icons " " "" "󱠇" "󰙊 " " " "󱓞 " "󰚱 " "󰸗 " " " " "
```
![./images/flame-red.png](./images/flame-red.png)

### No Seraprators & No Icon and Olive Gray Color
```shell
  set_color "dark" "#626F47" "#A4B465" "#F5ECD5" "#F0BB78" # gray olive
  set_icons "" "" "" "" "" "" "" "" " "MEM:" "CPU:" # use "" if don't want icon and seperator
```

![./images/noseparator-noicon.png](./images/noseparator-noicon.png)

### Triangle & Brown Yellow
- Can Use ANSI Color
```shell
  set_color dark "#4B352A" "#CA7842" "#B2CD9C" "#F0F2BD"
  set_icons "" "" "󱃸 " " " "󱪳 " " " "󱎫 " "󰸘 " "M:" "C:"
```
![/images/triangle-brown.png](./images/triangle-brown.png)

### Inverse Triangle & Neon (Ansi Color - no hex color)
- Can Use ANSI Color
```shell
  set_color default teal green cyan yellow
  set_icons "" "" " " "󱚟 " "󰠡 " "󰣉 " "󱦟 " "󰸗 " "󰰐 " "󰯲 "
```
![/images/inversetriangle-neon.png](./images/inversetriangle-neon.png)

