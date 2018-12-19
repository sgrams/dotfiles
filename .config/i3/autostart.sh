#!/bin/sh
xrandr --dpi 84 & ## xrandr
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & ## polkit
/home/sjg/.wal & ## wallpaper & colours
setxkbmap -layout pl & ## kb layout
LC_ALL=C xclip & ## better clipboard
dunst & ## OSD
compton & ## compositing manager
udiskie & ## external devices automounting
betterlockscreen -u $(cat .fehbg | sed '$!d' | awk -F"['']" '{print $2}')
