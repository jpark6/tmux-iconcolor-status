# tmux-iconcolor-status

- `tmux-iconcolor-status` tmux plugin that displays useful information in the tmux status line, such as session window, pane, cpu, mem, battery  
- Can easily modify the color, icon, and separators of the status bar


## 🎯 Features

- Display system information like CPU, memory, and battery 
- Easily change color/separator/icon

## ⚠️Preinstall
### Nerd Font
[Nerd Font github page](https://github.com/ryanoasis/nerd-fonts)
- Need to install the Nerd Font for the icons to display properly.
- No use Nerd Font
![./images/no-use-nerd-font.png](./images/no-use-nerd-font.png)
- Use Nerd Font
![./images/user-nerd-font.png](./images/use-nerd-font.png)

### plugins
[tmux-plugins/tmux-cpu](https://github.com/tmux-plugins/tmux-cpu)
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
  # or
  tmux source-file ~/.tmux.conf
  ```

## ✍️ Usage
- change `~/.tmux.conf`  and reload plugin
1. set options in `~/.tmux.conf` 
    - use `@iconcolor-theme`
    ```shell
    set -g @iconcolor-theme "pastel,pixel,target"

    set -g @iconcolor-show-session on
    set -g @iconcolor-show-user on
    set -g @iconcolor-show-pane on
    set -g @iconcolor-show-time on
    set -g @iconcolor-show-date on
    set -g @iconcolor-show-cpu-mem on
    set -g @iconcolor-show-battery on
    ```

    - use `@iconcolor-colors`, `@iconcolor-separators`, `@iconcolor-icons`
    ```shell
    set -g @iconcolor-colors "#FD8A8A,#F1F7B5,#A8D1D1,default" # PastelPink - pink yellow blue
    set -g @iconcolor-separators " , ,┃,┃," # pixel
    set -g @iconcolor-icons " , ,󰙄 ,󰣉 ,󰆤 , ,󱎫 ,󰸘 , , , ,󰁾 ,󰢝 ,"  # target

    set -g @iconcolor-show-session on
    set -g @iconcolor-show-user on
    set -g @iconcolor-show-pane on
    set -g @iconcolor-show-time on
    set -g @iconcolor-show-date on
    set -g @iconcolor-show-cpu-mem on
    set -g @iconcolor-show-battery on
    ```

2. reload `iconcolor-status.tmux` plugin
   - Reload tmux
   ```shell
   <prefix>+I # default tmux <prefix> is Ctrl+b
   # or
   tmux source-file ~/.tmux.conf
   ```

## Colors & Separators & Icons
  - Theme: For simple applying of colors, separators, and icons, use `@iconcolor-theme`
  - Preset: For detailed applying of colors, separators, and icons, use `@iconcolor-colors`, `@icon-separartors`, and `@iconcolor-icons`
  - If set both theme option and preset options, the theme option is applied and then overwritten by the preset options
  - It doesn't matter which option was declared first.

### Default
- if not set options in `~/.tmux.conf`
- applied default options 
  - separator : none
  - color: fg: terminal fg bg: terminal bg
  - icon: no icon
  - user name : on
  - cpu mem : off
  - battery : off

![./images/default-light.png](./images/default-light.png)
![./images/default-dark.png](./images/default-dark.png)

### Theme
- set `@iconcolor-theme` 
- parameter: "colors theme, separators theme, icons theme"
- theme list
    - colors:  
      coffee,cold,cyberpunk,flame,forest,gradient-blue,gradient-green,gradient-orange,gradient-purple,mint,neon-purple,neon-yellow,nord,ocean,olivegray,pastel-brown,pastel-cyan,pastel-cyan2,pastel-peach,pastel-purple,tokyonight,whitegreen  

    - separators:  
      round,flame,none,pixel,slant-down,slant-left,slant-up,triangle-inverse,triangle-left,triangle-right,wave

    - icons:  
      construction-emoji,music-emoji,night-emoji,sport-emoji,target-emoji,winter-emoji,airplane,biohazard,curvedarrow,hello,important,music,play,playround,ship,sport,star,steeringwheel,study,sun,surf,target,target,wave,winter,


#### Pastel Colors & Pixcel Separators & Target Emoji Icon(Current Window)
```shell
set -g @iconcolor-theme "pastel,pixel,target-emoji"
```
![./images/pastel-pixel-light.png](./images/pastel-pixel-light.png)
![./images/pastel-pixel-dark.png](./images/pastel-pixel-dark.png)

#### Gradient Green Colors & Slant Separators & Airplane Icon
```shell
set -g @iconcolor-theme "gradient-green,slant-right,airplane"
```  
![./images/green-slant-light.png](./images/green-slant-light.png)
![./images/green-slant-dark.png](./images/green-slant-dark.png)

#### Frame Colors & Flame Separators & Rocket Icon
```shell
set -g @iconcolor-theme "flame,flame,rocket"
```
![./images/flame-red-light.png](./images/flame-red-light.png)
![./images/flame-red-dark.png](./images/flame-red-dark.png)

#### Nord Colors & Triangle right Separators & Star Icon
```shell
set -g @iconcolor-theme "nord,triangle-right,star"

```
![./images/triangle-nord-light.png](./images/triangle-nord-light.png)
![./images/triangle-nord-dark.png](./images/triangle-nord-dark.png)



### Preset 
- set `@iconcolor-colors` 
  - parameter: "color1, color2, color3, bg"
- set `@iconcolor-separators` 
  - parameter: "section left, section right, separator left, separator right"
- set `@iconcolor-icons` 
  - parameter: "session,user,pane,current window,last window,zoomed window,time,date,charged,uncharging,charging"
- Presets in `preset.sh`
- Can apply those settings to the `~.tmux.conf` file. 
- Or you can apply any other settings.

#### Cyberpunk Colors & Rounded  Separators & round Icon
```shell
set -g @iconcolor-colors "#541690,#FF4949,#FFCD38,default" # Cyberpunk - purple pink orange
set -g @iconcolor-separators ",, , ," # round
set -g @iconcolor-icons "󰥱 ,󰙄 ,󰪟 ,󰀨 , , ,󱑁 ,󰸗 ,󰯲 ,󰰐 , ,󰁾 ,󰢝 ," # important
```
![./images/round-cyberpunk-light.png](./images/round-cyberpunk-light.png)
![./images/round-cyberpunk-dark.png](./images/round-cyberpunk-dark.png)


#### Cold Colors & Wave Separators & Surf Icon
```shell
set -g @iconcolor-colors "#005DFA,#8CB2F1,#D0CEDD,default" # Cold - blue skyblue white
set -g @iconcolor-separators " ,,┃,┃," # wave
set -g @iconcolor-icons " ,󱎂 ,󰠡 ,󱝆 ,󱁕, ,󰄉 ,󰸗 , , , ,󰁾 ,󰢝 ," # surf
```
![./images/wave-cold-light.png](./images/wave-cold-light.png)
![./images/wave-cold-dark.png](./images/wave-cold-dark.png)

#### Only Olive Text & No Separators No Icons
- Only set color1, the background will be transparent and the text will be color1.
- Set separators and icons to "," because if set them to "", the shell script will say they have no value.
```shell
set -g @iconcolor-colors "#627F47"
set -g @iconcolor-separators ","
set -g @iconcolor-icons ","
```

![./images/noseparator-noicon-grayolive-light.png](./images/noseparator-noicon-grayolive-light.png)
![./images/noseparator-noicon-grayolive-dark.png](./images/noseparator-noicon-grayolive-dark.png)

## Toggle Status
- Toggle all options for status-left and status-light on/off
- set option in `~/.tmux.conf`
```shell
set -g @iconcolor-show-session on # on / off
set -g @iconcolor-show-user on # on / off
set -g @iconcolor-show-pane on # on / off
set -g @iconcolor-show-time on # on / off
set -g @iconcolor-show-date on # on / off
set -g @iconcolor-show-cpu-mem on # on / off
set -g @iconcolor-show-battery on # on / off
```
### Default
- Not set any `icon-color-show-*` option 
- | session | user | pane | ... windows ... | time | date |
![./images/toggle-default-light.png](./images/toggle-default-light.png)
![./images/toggle-default-dark.png](./images/toggle-default-dark.png)

### All Off 
- Set all `@iconcolor-show-*` values to off
- When set to all off, window status is aligned to the left.
![./images/toggle-alloff-light.png](./images/toggle-alloff-light.png)
![./images/toggle-alloff-dark.png](./images/toggle-alloff-dark.png)
