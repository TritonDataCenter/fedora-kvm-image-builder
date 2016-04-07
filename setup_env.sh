#!/bin/bash

# Ensure we have the appropriate packages

set -euo pipefail
IFS=$'\n\t'

dnf install -y anaconda anaconda-runtime createrepo isomd5sum genisoimage rpmdevtools
