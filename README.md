# tmux-status

> `jpark6/tmux-status` is simple tmux status plugin

## Preinstall
### Nerd Font
[Nerd Font github page](https://github.com/ryanoasis/nerd-fonts)
Need to install the Nerd Font for the icons to display properly.
- not use Nerd Font
[./images/not-user-nerd-font.png](./images/not-use-nerd-font.png)

### plugins
If want to see mem/cpu usage percent  
Install [thewtex/tmux-mem-cpu-load](https://github.com/thewtex/tmux-mem-cpu-load)

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
Install tmux plugin
```shell
<prefix>+I # default tmux <prefix> is Ctrl+b
```

## Usage
- change `~/.tmux.conf`  and reload plugin
1. set options in `~/.tmux.conf` 
  - You can change it to any colors, icons or separators.
```shell
# example color, icons, separators, user name, mem, cpu
set -g @tmux-status-colors "default" 
set -g @tmux-status-separators ",,｜,｜," 
set -g @tmux-status-icons "🖥 ,🤖 ,🪟 ,🎯,✨,⏳️,📅,M:,C:"
set -g @tmux-status-show-user-name off
set -g @tmux-status-show-mem-cpu off
```
2. reload `tmux-status.tmux` plugin
  - Reload tmux
    - press \<prefix\>+I (default: \<C-b\>+I)
  - or run `tmux-status.tmux`
    - press \<prefix>+: and type `:run /path/to/plugin/tmux-status.tmux`
    - type command in shell: `tmux run /path/to/plugin/tmux-status.tmux`

### Colors & Separators & Icons
#### Default
- if not set options in `~/.tmux.conf`
- applied default options 
  - separator :  # Óright upper triangle
  - color: green orange yellow
  - icon: normal icons
  - mem cpu : off

![./images/default.png](./images/default.png)

#### Rounded Separators & Cyberpunk & round icons
```shell
set -g @tmux-status-colors "default,#541690,#FF4949,#FFCD38"
set -g @tmux-status-separators ",, , ,"
set -g @tmux-status-icons "󰥱 ,󰙄 ,󰪟 ,󰀨 , ,󱑁 ,󰸗 ,󰰐 ,󰯲 ,"
```
![./images/round-cyberpunk.png](./images/round-cyberpunk.png)

#### Triangle Separators & Nord Color & emoji icons 
```shell
set -g @tmux-status-colors "default,#88C0D0,#2E3440,#FFFFFF"
set -g @tmux-status-separators ",, , ,"
set -g @tmux-status-icons "🖥 ,🤖 ,🪟 ,🎯,✨,⏳️,📅, , ,"
```
![./images/triangle-nord.png](./images/triangle-nord.png)


### Wave Separators & Cold
```shell
set -g @tmux-status-colors "default,#006DFA,#8CB2F1,#D0CEDD"
set -g @tmux-status-separators " ,,,,"
set -g @tmux-status-icons "󰞍 ,󱝆 ,󱢋 ,󱢴 ,󱁕 ,󰄉 ,󰸗 , , ,"
```
![./images/wave-cold.png](./images/wave-cold.png)

#### Flame Separators & Red pearch Green
```shell
set -g @tmux-status-colors "default,#A62C2C,#E83F25,#EA7300"
set -g @tmux-status-separators " ,, , ,"
set -g @tmux-status-icons "󱠇 ,󰙊 , ,󱓞 , ,󱦟 ,󰸗 , , ,"
```
![./images/flame-red.png](./images/flame-red.png)

#### No Separator No Icon & Olive Gray Color
```shell
set -g @tmux-status-colors "default,#627F47,#A4B465,#F5ECD5"
set -g @tmux-status-separators ", "
set -g @tmux-status-icons ", "
```

![./images/noseparator-noicon-grayolive.png](./images/noseparator-noicon-grayolive.png)

### User Name
- I think the username is always the same value,
- so it doesn't really matter if it's not displayed,
- so I made it an on/off option.
#### No User Name
```shell
set -g @tmux-status-show-user-name "off" # off or "off"
```
![./images/no-user-name.png](./images/no-user-name.png)

#### Show User Name
```shell
set -g @tmux-status-show-user-name "on" # on of "on"
```
![./images/user-name.png](./images/user-name.png)




### Memory & CPU
#### No Memory & CPU Info
- If you don't want to see mem cpu info
- or not install tmux-mem-cpu-load plugin
```shell
set -g @tmux-status-mem-cpu "off" # off or "off"
```
![./images/no-mem-cpu.png](./images/no-mem-cpu.png)

#### Show Memory & CPU Info
```shell
set -g @tmux-status-show-mem-cpu "on" # on or "on"
```
![./images/mem-cpu.png](./images/mem-cpu.png)

### 