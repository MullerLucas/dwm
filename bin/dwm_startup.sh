#!/bin/bash

# Auto Start

nitrogen --restore &
#ckb-netxt -b -c &
#picom &

#[[ -f ~/.Xresources ]] && xrdb -I$HOME ~/.Xresources
#xset r rate 250 35

~/.local/bin/dwm/systray/dwm_systray.sh &

# Start & Restart DWM
while true; do
    # Log stderror to a file
    dwm 2> /home/lucas/.local/log/dwm/dwm.log
    # No error logging
    #dwm >/dev/null 2>&1
done
