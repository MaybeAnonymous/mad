#!/bin/sh
if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then

    printf -- "usage: screenshot.sh [options]\n"
    printf -- "--help -h\tshow this help screen\n"
    printf -- "--select -s\tuse slurp to select screenshot region\n"
elif [ "$1" = "--select" ] || [ "$1" = "-s" ]; then
    grim -g "$(slurp -d)" -t png - | wl-copy -t image/png
else
    grim -t png - | wl-copy -t image/png
fi
