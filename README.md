# Fedora KVM Image Builder

This repo allows one to create a custom Fedora ISO and image with the necessary packages and tooling for deploying on SmartOS, SDC and the Joyent Public Cloud.

## Requirements

In order to use this repo, you need to have the following:

 * SmartOS
 * A running Fedora or CentOS instance (physical or virtual) with spare disk space
 * sdc-vmtools

## Setup

Included is a `setup_env.sh` script to be run inside the Fedora or CentOS instance. This script will install the necessary packages required for the `create-iso` and script.

## Usage

To build a custom ISO, run the `create-iso` script:

    ./create-iso -m <MIRROR> -i <ISO> -c <ISO_CHECKSUM> -d <ISO_DIR> -M <MOUNT_POINT> -l <DVD_LAYOUT> -f <ISO_FILENAME>

See `./create-iso -h` for usage.

The resulting ISO will be ready to boot and install a clean image ready for SmartOS, SDC and the Joyent Public Cloud.

On a SmartOS machine you can then create an image with:

```
./create-image -i <ISO> -n <IMAGE_NAME> -d <DESC> -u <HOMEPAGE> -o <OWNER_UUID> -p <IP> -m NETMASK -g <GATEWAY> -v <VLAN_ID> -U <NETWORK_UUID>
```

See `./create-image -h` for usage.

## Default Settings For Image

* Stock Kernel
* US Keyboard and Language
* Firewall enabled with SSH allowed
* Passwords are using SHA512
* Firstboot disabled
* SELinux is set to permissive
* Timezone is set to UTC
* Disk is 10GB in size
* Default packages installed
    * @core
    * man
    * net-tools
    * ntp
    * ntpdate
    * parted
    * vim-enhanced
    * vim-minimal
    * wget
