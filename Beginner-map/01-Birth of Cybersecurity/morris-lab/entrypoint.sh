#!/bin/bash

rm -f /home/victim/flag.txt
rm -f /tmp/morris.pid
rm -f /tmp/morris.log

# Start SSH
/usr/sbin/sshd

# Start Morris worm
nohup /opt/kytinx/morris.sh >/dev/null 2>&1 &
echo $! > /tmp/morris.pid

# Start watcher
nohup /opt/kytinx/watcher.sh >/dev/null 2>&1 &

echo "Lab started."

# Keep container alive
tail -f /dev/null