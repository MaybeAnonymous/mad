#!/usr/bin/env sh

#------------#
# i3 startup #
#------------#
killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done
polybar main --config="$HOME/.config/polybar/config-i3.ini" &
