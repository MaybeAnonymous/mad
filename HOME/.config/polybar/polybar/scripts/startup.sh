#!/usr/bin/env sh

# S T A R T U P .sh ---

killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done
polybar main &
