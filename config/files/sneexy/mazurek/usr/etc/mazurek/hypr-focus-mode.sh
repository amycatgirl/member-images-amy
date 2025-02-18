#!/usr/bin/env sh
set -oue pipefail

FOCUSMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$FOCUSMODE" = 1 ] ; then
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:drop_shadow 0;\
        keyword decoration:blur:enabled 0;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0"
    notify-send "Focus Mode enabled" "Press Super + F12 to disable"
    exit
fi
hyprctl reload
notify-send "Focus Mode disabled" "Press Super + F12 to enable"