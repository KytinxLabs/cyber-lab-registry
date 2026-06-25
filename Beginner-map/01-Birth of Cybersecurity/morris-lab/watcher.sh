#!/bin/bash

_p="/tmp/morris.pid"
_r="/opt/kytinx/flag.sh"

_a=$(cat "$_p")

printf "\133*\135 Watching PID %s\n" "$_a"

while kill -0 "$_a" 2>/dev/null
do
    sleep 1
done

printf "\133+\135 Morris Worm terminated.\n"

exec "$_r"