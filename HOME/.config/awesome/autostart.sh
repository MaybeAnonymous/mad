#!/bin/sh

#   _` |\ \  \   / _ \  __|  _ \  __ `__ \   _ \
#  (   | \ \  \ /  __/\__ \ (   | |   |   |  __/
# \__,_|  \_/\_/ \___|____/\___/ _|  _|  _|\___|

# > Main
lxpolkit &
feh --bg-scale "$HOME/Pictures/Backgrounds/wallpaper.png" &
pgrep blueman-applet || blueman-applet &
#pgrep conky || conky &
pgrep xfce4-clipman || xfce4-clipman &
pgrep nm-applet || nm-applet &
pgrep redshift-gtk || redshift-gtk &
picom --vsync --backend glx &
xss-lock -l env XSECURELOCK_SHOW_USERNAME=0 XSECURELOCK_SHOW_HOSTNAME=0 XSECURELOCK_FONT=Jetbrains\ Mono XSECURELOCK_PASSWORD_PROMPT=time_hex xsecurelock &

# > Devices
xinput --set-int-prop "ELAN0504:00 04F3:3091 Touchpad" "libinput Natural Scrolling Enabled" 8 1 &
xinput set-prop "ELAN0504:00 04F3:3091 Touchpad" "libinput Disable While Typing Enabled" 1 &
xinput set-prop "ELAN0504:00 04F3:3091 Touchpad" "libinput Tapping Enabled" 1 &
xinput set-prop "Logitech M510" 324 0.45 # Set mouse speed ( default 0 )
xset m 0 0
