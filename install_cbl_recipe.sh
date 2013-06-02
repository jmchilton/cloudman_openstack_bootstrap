#!/bin/bash

. galaxy_env
cd $CBL_HOME

cblfab "$1" "install_chef_recipe:$2"
