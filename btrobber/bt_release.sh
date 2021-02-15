#!/usr/bin/env bash

# Disable bluetooth on local machine and enable it on remote machine so that
# connections to bluetooth devices from the local machine are dropped and
# then reestablished on the remote machine.
# Usage: ./bt_release <remote-host>
function main
{
  local remote_host="$1"
  # Ensure local bluetooth is off.
  echo $(/usr/local/bin/blueutil off)
  # Enable remote bluetooth.
  ssh "${remote_host}" '/usr/local/bin/blueutil -p 1'
  # Wait 30 seconds for devices to connect with remote machine.
  echo $(/bin/sleep 30)
  # Reenable local bluetooth.
  echo $(/usr/local/bin/blueutil on)
}

main "$@"
