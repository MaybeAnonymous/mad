#!/bin/sh

#       _   _ _
#  __ _| |_(_) |___
# / _` |  _| | / -_)
# \__, |\__|_|_\___|
#    |_| Hello, world!

#------#
# Main #
#------#
exec $HOME/.config/dunst/scripts/startup.sh & # Start dunst ( notifications )
lxpolkit &
nitrogen --set-auto "$HOME/Pictures/Backgrounds/wallpaper.png" &
pgrep blueman-applet || blueman-applet & # Bluetooth applet
pgrep nm-applet || nm-applet & # Network Manager
pgrep conky || conky & # Start conky
pgrep picom || picom & # Start the compositor
pgrep redshift-gtk || redshift-gtk & # Redshift ( Change screen temperature automatically )
pgrep xfce4-clipman || xfce4-clipman & # Clipboard Manager
setxkbmap -model abnt2 -layout br & # Set keyboard layout
xss-lock -l env XSECURELOCK_SHOW_USERNAME=0 XSECURELOCK_SHOW_HOSTNAME=0 XSECURELOCK_FONT=Jetbrains\ Mono XSECURELOCK_PASSWORD_PROMPT=time_hex xsecurelock &

#---------#
# Devices #
#---------#
xinput --set-int-prop "ELAN0504:00 04F3:3091 Touchpad" "libinput Natural Scrolling Enabled" 8 1 &
xinput set-prop "ELAN0504:00 04F3:3091 Touchpad" "libinput Disable While Typing Enabled" 1 &
xinput set-prop "ELAN0504:00 04F3:3091 Touchpad" "libinput Tapping Enabled" 1 &
xinput set-button-map "Compx 2.4G Receiver Mouse" 1 2 3 4 5 6 7 2 9 &
setxkbmap -layout br -model abnt2 &
