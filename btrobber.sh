#!/usr/bin/env bash

# Disable bluetooth on local machine and enable it on remote machine so that
# connections to bluetooth devices from the local machine are dropped and
# then reestablished on the remote machine.
# Usage: release <remote-host>
function release
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

# Disable bluetooth on the remote machine and enable it on the local machine so
# that connections to bluetooth devices from the remote machine are dropped and
# then reestablished on the local machine.
# Usage: steal <remote-host>
function steal
{
  local remote_host="$1"
  # Ensure local bluetooth is off.
  echo $(/usr/local/bin/blueutil off)
  # Disable remote bluetooth.
  ssh "${remote_host}" '/usr/local/bin/blueutil -p 0'
  # Reenable local bluetooth
  echo $(/usr/local/bin/blueutil on)
}

# Usage: ./btrobber.sh <remote-host> (steal|release)
function main
{
  local remote_host="$1"
  local action="$2"
  if [[ "${action}" == "steal" ]]; then
    steal "${remote_host}"
  elif [[ "${action}" == "release" ]]; then
    release "${remote_host}"
  else
    echo "Error: invalid action ${action}."
    return 1
  fi

  return 0
}

main "$@"
