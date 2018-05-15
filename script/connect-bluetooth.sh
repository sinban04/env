#!/bin/bash

coproc bluetoothctl
echo -e 'connect 34:88:5D:81:80:77\nexit' >&${COPROC[1]}
output=$(cat <&${COPROC[0]})
echo $output
