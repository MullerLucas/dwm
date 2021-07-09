#!/bin/bash

elementPath="/home/lucas/.local/bin/dwm/systray/elements"

separator="|"

paddingLeft=" "
uptime=-1
timeDate=" - "
netSpeed=" - "
packageUpdates=" - "

update_1s()
{
	return 0
}

update_2s()
{
	[ $(( SECONDS%2 )) -ne 0 ] && return 0

	timeDate=$($elementPath/dwm_systray_timeDate.sh)
}

update_10s()
{
	[ $(( SECONDS%10 )) -ne 0 ] && return 0
}

update_1m()
{
	[ $(( SECONDS%60 )) -ne 0 ] && return 0

	(( uptime++ ))
}

update_1h()
{
	[ $(( SECONDS%360 )) -ne 0 ] && return 0

	packageUpdates=$($elementPath/dwm_systray_packageUpdates.sh)
}

set_text()
{
	text="${paddingLeft} ${uptime}m $separator $packageUpdates $separator $timeDate"
	xsetroot -name "$text"
}

while true;
do
	# update_1s
	update_2s
	# update_10s
	update_1m
	update_1h

	set_text

	sleep 1s
done



