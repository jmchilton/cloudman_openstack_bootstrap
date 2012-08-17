#!/bin/bash

# Usage: ./install_cloudman.sh <ipaddress> [<cbl_package_list>]
# 
#
# Description: This script installs CloudMan to the IP adress specified by its
# argument via CloudBioLinux.

. galaxy_env
cd $CBL_HOME

for PREINSTALL_COMMAND in "${CBL_PREINSTALL_CMDS[@]}"
do
    echo "Running command $PREINSTALL_COMMAND"
    cblssh "$1" /bin/bash -c "'$PREINSTALL_COMMAND'"
done

PACKAGE_LIST_ARG=${2:-$CBL_PACKAGE_LIST}
echo "Install CloudBioLinux with package list: $PACKAGE_LIST_ARG"
fab -i "$KEYFILE" -f fabfile.py -H ubuntu@"$1" -c "$CBL_FABRICRC" "install_biolinux:packagelist=$PACKAGE_LIST_ARG"
