#!/bin/sh

HOST=10.0.0.84

if ! ping=$(ping -n -c 1 -W 1 $HOST); then
    echo "# ping failed"
else
    rtt=$(echo "$ping" | sed -rn 's/.*time=([0-9]{1,})\.?[0-9]{0,} ms.*/\1/p')

    if [ "$rtt" -lt 50 ]; then
        icon="%{F#3cb703}%{F-}"
    elif [ "$rtt" -lt 150 ]; then
        icon="%{F#f9dd04}%{F-}"
    else
        icon="%{F#d60606}how %{F-}"
    fi

    echo "$icon $rtt ms"
fi