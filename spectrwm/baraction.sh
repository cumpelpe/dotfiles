#!/usr/bin/env bash

### DISK
hdd() {
    hdd="$(df -h | awk 'NR==4{print $3, $5}')"
    echo -e "HDD: $hdd"
}
#ssd() {
#    ssd="$(df -h | awk 'NR==4{print $3, $5}')"
#    echo -e "HDD: $ssd"
#}

### RAM
mem() {
    mem=`free | awk '/Mem/ {printf "%d MiB/%d MiB\n", $3 / 1024.0, $2 / 1024.0}'`
    echo -e "MEM: $mem"
}

### CPU
cpu() {
    read cpu a b c previdle rest < /proc/stat
    prevtotal=$((a+b+c+previdle))
    sleep 0.5
    read cpu a b c idle rest < /proc/stat
    total=$((a+b+c+idle))
    cpu=$((100*( (total - prevtotal) - (idle - previdle) ) / (total - prevtotal) ))
    echo -e "CPU: $cpu%"
}

### VOLUME
vol() {
    vol=`amixer get Master | awk -F'[][]' 'END{ print $4":"$2 }'`
    echo -e "VOL: $vol"
}

SLEEP_SEC=5

while :; do
    echo "$(cpu) | $(mem) | $(hdd) | $(vol)"
    sleep $SLEEP_SEC
done
