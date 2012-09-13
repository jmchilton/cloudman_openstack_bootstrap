#!/bin/bash

. galaxy_env
cd $CBL_HOME

echo "Install CloudBioLinux with package list: $PACKAGE_LIST_ARG"
cblfab "$1" "install_custom:$2"
