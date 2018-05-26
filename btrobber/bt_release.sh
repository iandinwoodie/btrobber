#!/usr/bin/env bash
# Disable BT on local machine and enable it on remote machine, so KB/Mouse reconnect to remote machine.
# ensure local bluetooth is off
echo $(/usr/local/bin/blueutil off)
# enable imac bluetooth
ssh neon '/usr/local/bin/blueutil -p 1'
# wait 2 minutes for keyboard to reconnect with remote machine
echo $(/bin/sleep 30)
# enable local bluetooth
echo $(/usr/local/bin/blueutil on)
# record the new status
echo "echo \"off\"" > ~/bt_status.sh
