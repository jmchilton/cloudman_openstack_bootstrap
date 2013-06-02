#!/bin/bash

. galaxy_env
cd $CBL_HOME

CBL_FLAVOR_ARG=$CBL_FLAVOR
echo "Install CloudBioLinux with package list: $PACKAGE_LIST_ARG"
cblfab "$1" "install_biolinux:flavor=$CBL_FLAVOR_ARG,target=$2"
