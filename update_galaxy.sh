#!/bin/bash

# Usage: ./install_cloudman.sh <ipaddress> [<cbl_package_list>]
# 
#
# Description: This script installs CloudMan to the IP adress specified by its
# argument via CloudBioLinux.

. galaxy_env

echo "Updating galaxy"
cblfab "$1"  -f util/tasks_fabfile.py  "update_galaxy"
