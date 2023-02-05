#!/bin/sh

#  _
# | |__         ___       _ __           __      __     _ __ ___
# | '_ \       / __|     | '_ \          \ \ /\ / /    | '_ ` _ \
# | |_) |      \__ \     | |_) |          \ V  V /     | | | | | |
# |_.__/inary |___/pace  | .__/artitioning \_/\_/indow |_| |_| |_|anager
#                        |_|

# > Startup
exec $HOME/.config/dunst/scripts/startup.sh &
exec $HOME/.config/polybar/scripts/startup.sh &
lxpolkit &
feh --bg-scale "$HOME/.config/wallpaper.png" &
pgrep blueman-applet || blueman-applet &
#pgrep conky || conky &
pgrep nm-applet || nm-applet &
pgrep redshift-gtk || redshift-gtk &
pgrep xfce4-clipman || xfce4-clipman &
picom --vsync --backend glx &
xss-lock -l env XSECURELOCK_SHOW_USERNAME=0 XSECURELOCK_SHOW_HOSTNAME=0 XSECURELOCK_FONT=Jetbrains\ Mono XSECURELOCK_PASSWORD_PROMPT=time_hex xsecurelock &

# > Audio
pipewire &
pipewire-pulse &
pgrep wireplumber || wireplumber &

# > Devices
xinput --set-int-prop "ELAN0504:00 04F3:3091 Touchpad" "libinput Natural Scrolling Enabled" 8 1 &
xinput set-prop "ELAN0504:00 04F3:3091 Touchpad" "libinput Disable While Typing Enabled" 1 &
xinput set-prop "ELAN0504:00 04F3:3091 Touchpad" "libinput Tapping Enabled" 1 &
xinput set-prop "Logitech M510" 324 0.45 # Set mouse speed ( default 0 )
xset m 0 0
