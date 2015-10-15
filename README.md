# Fedora KVM Image Builder

This repo allows one to create a custom Fedora ISO and image with the necessary packages and tooling for deploying on SmartOS, SDC and the Joyent Public Cloud.

## Requirements

In order to use this repo, you need to have the following:

 * SmartOS
 * A running Fedora or CentOS instance (physical or virtual) with spare disk space
 * sdc-vmtools

## Setup

Included is a `setup_env.sh` script to be run inside the Fedora or CentOS instance. This script will install the necessary packages required to for the `create-image` script.

## Using

The next script is `create_iso` which takes a series of commands:

 * fetch
 * layout
 * finish

### fetch
This command will fetch the DVD ISO from the mirror specified by `$MIRROR`.

### layout
This command will extract the ISO and place it onto disk.

## finish
This command will cleanup the layout, copy over the kickstart file in `./ks.cfg`, modify the boot menu to add the kickstart file, and creates the ISO in `./iso`.

You can run each command separately or all together.

    ./create_iso fetch
    ./create_iso layout
    ./create_iso finish

Or `./create_iso fetch layout finish`.

The resulting ISO will be ready to boot and install a clean image ready for SmartOS, SDC and the Joyent Public Cloud.

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
