#!/bin/bash
killall xdg-desktop-portal-hyprland
killall xdg-desktop-portal-wlr
killall xdg-desktop-portal
sleep 1
# These paths might be different depending on your system.
/usr/lib/xdg-desktop-portal &
/usr/libexec/xdg-desktop-portal-hyprland &
