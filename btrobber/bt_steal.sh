#!/usr/bin/env bash

# Disable bluetooth on the remove machine and enable it on the local machine so
# that connections to bluetooth devices from the remove machine are dropped and
# then reestablished on the local machine.
# Usage: ./bt_release <remote-host>
function main
{
  local remote_host="$1"
  # Ensure local bluetooth is off.
  echo $(/usr/local/bin/blueutil off)
  # Disable remote bluetooth.
  ssh "${remote_host}" '/usr/local/bin/blueutil -p 0'
  # Reenable local bluetooth
  echo $(/usr/local/bin/blueutil on)
}

main "$@"
