#!/usr/bin/env bash
# Disable BT on remote machine and enable it on local machine, so KB/Mouse reconnect to local machine.
#ensure local bluetooth is off
echo $(/usr/local/bin/blueutil off)
#disable imac bluetooth
ssh neon '/usr/local/bin/blueutil -p 0'
#enable local bluetooth
echo $(/usr/local/bin/blueutil on)
# record the new status
echo "echo \"on\"" > ~/bt_status.sh
