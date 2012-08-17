#!/bin/bash

# Usage: ./install_cbl_min.sh <ipaddress>
# 
# Description: This script installs the minimal cloudbiolinux packaging to the IP
# adress specified by its argument.

. galaxy_env
bash install_cloudman.sh "$1" "$CBL_HOME/contrib/minimal/main.yaml"
