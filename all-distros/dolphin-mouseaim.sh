#!/bin/bash
if [ ! -f "/usr/bin/xdotool" ]; then
    sudo apt install -y unclutter
    sudo apt install -y xdotool
fi
xinput --set-prop 10 "Device Accel Constant Deceleration" 0.1
unclutter -idle 0.0000000000000001 -root &
while true; do
    xdotool mousemove 960 540
    sleep 0.08
done


