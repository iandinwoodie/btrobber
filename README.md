# btrobber

A simple script for facilitating bluetooth handoff between a local and remote
macOS device. This can be useful when you want to migrate bluetooth connections
away from an iMac that will be subjected to target display mode (TDM).

## Requirements

- [blueutil](https://github.com/toy/blueutil)
  - Installed on both local and remote machines.
- An established SSH key pair between local and remote machines.
  - The script will attempt to `ssh <remote-host>`.

## Usage

```bash
./btrobber.sh <remote-host> (steal|release)
```

### Example

To steal bluetooth from the device at address 192.168.1.15, run the following:

```bash
./btrobber.sh 192.168.1.15 steal
```

To release bluetooth back to the device located at 192.168.1.15, run the
following:

```bash
./btrobber.sh 192.168.1.15 release
```

