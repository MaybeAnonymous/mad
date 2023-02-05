#!/bin/sh

#       _
#     _| |      _      ___      __ ___
#    /_` |     \ \ /\ / /     /'_ ` _ \
#   |(_| |      \ V  V /     | | | | | |
#   \__,_|ynamic \_/\_/indow |_| |_| |_|anager

# > Startup
exec $HOME/.config/dunst/scripts/startup.sh & # Start dunst ( notifications )
lxpolkit &
feh --bg-scale "$HOME/.config/wallpaper.png" &
pgrep blueman-applet || blueman-applet & # Bluetooth applet
pgrep nm-applet || nm-applet & # Network Manager
pgrep picom || picom & # Start the compositor
pgrep redshift-gtk || redshift-gtk & # Redshift ( Change screen temperature automatically )
pgrep xfce4-clipman || xfce4-clipman & # Clipboard Manager
setxkbmap -model abnt2 -layout br & # Set keyboard layout
xss-lock -l env XSECURELOCK_SHOW_USERNAME=0 XSECURELOCK_SHOW_HOSTNAME=0 XSECURELOCK_FONT=Jetbrains\ Mono XSECURELOCK_PASSWORD_PROMPT=time_hex xsecurelock &

# > Audio
pipewire &
pipewire-pulse &
pgrep wireplumber || wireplumber &

# > Devices
xinput --set-int-prop "ELAN0504:00 04F3:3091 Touchpad" "libinput Natural Scrolling Enabled" 8 1 & # Reversed scrolling for mousepad
xinput set-prop "ELAN0504:00 04F3:3091 Touchpad" "libinput Disable While Typing Enabled" 1 &
xinput set-prop "ELAN0504:00 04F3:3091 Touchpad" "libinput Tapping Enabled" 1 &
xinput set-prop "Logitech M510" 324 0.45 # Set mouse speed ( default 0 )
xset m 0 0
