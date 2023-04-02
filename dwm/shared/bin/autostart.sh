#!/usr/bin/env bash

## Copyright (C) 2020-2022 Aditya Shakya <adi1090x@gmail.com>
## Everyone is permitted to copy and distribute copies of this file under GNU-GPL3
## Autostart Programs

# Kill already running process
_ps=(picom dunst ksuperkey mpd xfce-polkit xfce4-power-manager)
for _prs in "${_ps[@]}"; do
	if [[ `pidof ${_prs}` ]]; then
		killall -9 ${_prs}
	fi
done

# Fix cursor
xsetroot -cursor_name left_ptr

# Fix Audio & Brightness
alsactl init
xbacklight -set 20

# Polkit agent
#/usr/lib/xfce-polkit/xfce-polkit &

# Enable power management
xfce4-power-manager &

# Enable Super Keys For Menu
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &

# Restore wallpaper
hsetroot -cover $(xdg-user-dir)/Pictures/Wallpapers/$(ls $(xdg-user-dir)/Pictures/Wallpapers | shuf -n1)

# Lauch dwmbar
/usr/share/dwm/bin/dwmbar.sh &

# Lauch notification daemon
/usr/share/dwm/bin/dwmdunst.sh

# Lauch compositor
/usr/share/dwm/bin/dwmcomp.sh

# Start mpd
exec mpd &

# Fix Java problems
wmname "LG3D"
export _JAVA_AWT_WM_NONREPARENTING=1

# sync mail
# mailsync

# Load ST Config
xrdb merge $(xdg-user-dir)/.xresources

# eye confort
redshift -P -O 4500K

#launch dbus
# dbus-launch

#disconnect from wifi
nmcli device disconnect ifname wlan0

# Launch DWM
# while dwm; [ $? -ne 0  ]; do echo "start dwm"; done
echo "$(date): Starting DWM" >> $(xdg-user-dir)/Documents/Logs/dwm/$(date +%Y-%m-%d_%H.dwm.log)
dwm >> $(xdg-user-dir)/Documents/Logs/dwm/$(date +%Y-%m-%d_%H.dwm.log) 2>&1
