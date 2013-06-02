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

CBL_FLAVOR_ARG=${2:-$CBL_FLAVOR}
echo "Install CloudBioLinux with flavor: $CBL_FLAVOR_ARG"
cblfab "$1" "install_biolinux:flavor=$CBL_FLAVOR_ARG"

for POSTINSTALL_COMMAND in "${CBL_POSTINSTALL_CMDS[@]}"
do
    echo "Running command $POSTINSTALL_COMMAND"
    cblssh "$1" /bin/bash -c "'$POSTINSTALL_COMMAND'"
done
