#!/usr/bin/env bash

#
# Script used by i3status-rs, as a custom block, to display Bluetooth status in the status bar.
#

powered() {
	adapter_power=$(bluetoothctl show | grep "Powered" | cut -d" " -f 2)
	[ ${adapter_power} = yes ]
}

connected_to_dev_name() {
	bluetoothctl info | grep "Name" | cut -d" " -f2-
}

icon="bluetooth"
state="Idle"
text=""
if powered; then
	dev_name=$(connected_to_dev_name)
	if [ -z "${dev_name}" ]; then
		state="Warning"
	else
		state="Good"
		text="${dev_name}"
	fi
fi

echo -n "{\"icon\":\"${icon}\",\"state\":\"${state}\",\"text\":\"${text}\"}"
