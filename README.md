# tmux-iconcolor-status

- `tmux-iconcolor-status` tmux plugin that displays useful information in the tmux status line, such as session window, pane, cpu, mem, battery  
- Can easily modify the color, icon, and separators of the status bar


## 🎯 Features

- Display system information like CPU, memory, and battery 
- Easily change color/separator/icon

## ⚠️Preinstall
### Nerd Font
[Nerd Font github page](https://github.com/ryanoasis/nerd-fonts)
Need to install the Nerd Font for the icons to display properly.
- Not use Nerd Font
![./images/no-use-nerd-font.png](./images/no-use-nerd-font.png)
- Use Nerd Font
![./images/user-nerd-font.png](./images/use-nerd-font.png)

### plugins
[thewtex/tmux-mem-cpu-load](https://github.com/thewtex/tmux-mem-cpu-load)
- show cpu mem percentage

[tmux-plugins/tmux-battery](https://github.com/tmux-plugins/tmux-battery)
- show battary status and percentage


## 🔨 Install
###  Tmux Plugin Manager (TPM)

- add in `~/.tmux.conf`
```shell
set -g @plugin 'jpark6/tmux-iconcolor-status'
```

### Manual
- Clone this repository in your `$HOME/.tmux/` directory:

  ```shell
  git clone https://github.com/jpark6/tmux-iconcolor-status.git $HOME/.tmux/plugins/tmux-iconcolor-status
  ```

- add to  `.tmux.conf` file:

  ```shell
  run $HOME/.tmux/plugins/tmux-iconcolor-status/iconcolor-status.tmux
  ```

### Install Plugin
- For both TPM and Manual methods, you must enter the install command.
  ```shell
  <prefix>+I # default tmux <prefix> is Ctrl+b
  ```

## Usage
- change `~/.tmux.conf`  and reload plugin
1. set options in `~/.tmux.conf` 
  - You can change it to any colors, icons or separators.
  - colors : "status_bg,color1,color2,color3"
    - status_bg : default: transparent, dark/black : theme dark color, light/white : theme light color, #[A-Fa-f0-9]{6} : rgb hex color
    - color1 : main color, color2 : sub color, color3 : third color
  - separators "section_left_icon,section_right_icon,separator_left_icon,separator_right_icon"
  - icons "session,user,pane,current window,prev windows,time,date,cpu,memory,charged,discharged,charging"
```shell
# example color, icons, separators, user name, mem, cpu
set -g @iconcolor-colors "default,#FD8A8A,#F1F7B5,#A8D1D1" 
set -g @iconcolor-separators ",,｜,｜," 
set -g @iconcolor-icons "🖥 ,🤖 ,🪟 ,🎯,✨,⏳️,📅, , ,⚡️ ,🪫,🔋,"
set -g @iconcolor-show-user-name on
set -g @iconcolor-show-cpu-mem off
set -g @iconcolor-show-battery on
```
- example options screenshot
- light terminal theme
![./images/example-light.png](./images/example-light.png)
- dark terminal theme
![./images/example-dark.png](./images/example-dark.png)

2. reload `iconcolor.tmux` plugin
  - Reload tmux
  ```shell
  <prefix>+I # default tmux <prefix> is Ctrl+b
  ```

## Colors & Separators & Icons
### Default
- if not set options in `~/.tmux.conf`
- applied default options 
  - separator : `` # right upper triangle
  - color: green orange yellow
  - icon: normal icons
  - user name : on
  - cpu mem : off

![./images/default-light.png](./images/default-light.png)
![./images/default-dark.png](./images/default-dark.png)

### Rounded Separators & Cyberpunk & round icons
```shell
set -g @iconcolor-colors "default,#541692,#FF4949,#FFCD38"
set -g @iconcolor-separators ",, , ,"
set -g @iconcolor-icons "  ,󰙄 ,󱪳 , , ,󱎫 ,󰸘 ,󰯲 ,󰰐 ,󰚥 , ,󰂄 ," # play round
```
![./images/round-cyberpunk-light.png](./images/round-cyberpunk-light.png)
![./images/round-cyberpunk-dark.png](./images/round-cyberpunk-dark.png)

### Triangle Separators & Nord Color & emoji icons 
```shell
set -g @iconcolor-colors "default,#88C0D0,#2E3440,#FFFFFF"
set -g @iconcolor-separators ",, , ,"
set -g @iconcolor-icons "🖥 ,🤖 ,🪟 ,🎯,✨,⏳️,📅, , ,⚡️ ,🪫,🔋," # target emoji

```
![./images/triangle-nord-light.png](./images/triangle-nord-light.png)
![./images/triangle-nord-dark.png](./images/triangle-nord-dark.png)

### Pixel Separators & Pastel & Construction emoji icons
```shell
set -g @iconcolor-colors "default,#6EABD6,#FEFBC7,#FFB4B4" # PastlCyan2 - more bright
set -g @iconcolor-separators " , ,,," # pixel
set -g @iconcolor-icons "🧱,👷,🪟 ,🏗 ,🚧,⏳️,📅, , , ,󱊢 ,󱊥 ," # construction emoji

```
![./images/pixel-pastel-light.png](./images/pixel-pastel-light.png)
![./images/pixel-pastel-dark.png](./images/pixel-pastel-dark.png)

### Wave Separators & Cold & beach icons
```shell
set -g @iconcolor-colors "default,#006DFA,#8CB2F1,#D0CEDD"
set -g @iconcolor-separators " ,,,,"
set -g @iconcolor-icons "󰞍 ,󱝆 ,󱢋 ,󱢴 ,󱁕 ,󰄉 ,󰸗 , , , ,󰁾 ,󰢝 ," # wave
```
![./images/wave-cold-light.png](./images/wave-cold-light.png)
![./images/wave-cold-dark.png](./images/wave-cold-dark.png)

### Flame Separators & Red
```shell
set -g @iconcolor-colors "default,#A62C2C,#E83F25,#EA7300"
set -g @iconcolor-separators " ,, , ,"
set -g @iconcolor-icons "󱠇 ,󰙊 , ,󱓞 , ,󱦟 ,󰸗 , , , ,󰁾 ,󰢝 ," # hello

```
![./images/flame-red-light.png](./images/flame-red-light.png)
![./images/flame-red-dark.png](./images/flame-red-dark.png)

### No Separator No Icon & Olive 
```shell
set -g @iconcolor-colors "default,#627F47,#A4B465,#F5ECD5"
set -g @iconcolor-separators ", "
set -g @iconcolor-icons ", "
```

![./images/noseparator-noicon-grayolive-light.png](./images/noseparator-noicon-grayolive-light.png)
![./images/noseparator-noicon-grayolive-dark.png](./images/noseparator-noicon-grayolive-dark.png)


## User Name
- I think the username is always the same value,
- so it doesn't matter if it's not displayed,
- so I made it an on/off option.
- default : on
### No User Name
```shell
set -g @iconcolor-show-user-name "off" # off or "off"
```
![./images/no-user-name-light.png](./images/no-user-name-light.png)
![./images/no-user-name-dark.png](./images/no-user-name-dark.png)

### Show User Name
```shell
set -g @iconcolor-show-user-name "on" # on of "on"
```
![./images/user-name-light.png](./images/user-name-light.png)
![./images/user-name-dark.png](./images/user-name-dark.png)

## CPU & Memory
### No CPU & Memory Info
- If you don't want to see cpu mem info
- or not install [thewtex/tmux-mem-cpu-load](https://github.com/thewtex/tmux-mem-cpu-load) plugin
- default : off
```shell
set -g @iconcolor-show-cpu-mem "off" # off or "off"
```
![./images/no-cpu-mem-light.png](./images/no-cpu-mem-light.png)
![./images/no-cpu-mem-dark.png](./images/no-cpu-mem-dark.png)

### Show CPU & Memory Info
```shell
set -g @iconcolor-show-cpu-mem "on" # on or "on"
```
![./images/cpu-mem-light.png](./images/cpu-mem-light.png)
![./images/cpu-mem-dark.png](./images/cpu-mem-dark.png)

## battery
### No battery Info
- If you don't want to see battery info
- or not install [tmux-plugins/tmux-battery](https://github.com/tmux-plugins/tmux-battery) plugin
- default : off
```shell
set -g @iconcolor-show-battery "off" # off or "off"
```
![./images/no-battery-mem-light.png](./images/no-battery-light.png)
![./images/no-battery-mem-dark.png](./images/no-battery-dark.png)

### Show Battery Info
```shell
set -g @iconcolor-show-battery "on" # on or "on"
```
![./images/battery-light.png](./images/battery-light.png)
![./images/battery-dark.png](./images/battery-dark.png)

##  Presets
- Presets in `preset.sh`
- You can apply those settings to the `~.tmux.conf` file. 
- Or you can apply any other settings.

