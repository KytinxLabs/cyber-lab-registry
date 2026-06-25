#!/bin/bash

echo "[*] Morris Worm started."

while true
do
    # Burn CPU
    for i in $(seq 1 500000)
    do
        :
    done

    echo "$(date) Morris replication..." >> /tmp/morris.log
done