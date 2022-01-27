#!/usr/bin/env sh

# Terminate already running dunst instances
killall -q dunst

# Wait until the processes have been shut down
while pgrep -x dunst >/dev/null; do sleep 1; done

# Launch dunst
dunst
