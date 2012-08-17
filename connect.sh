#!/bin/bash

# Usage: ./connect.sh <instance_ip> 
# 
#
# Description: Interactive SSH into OpenStack machine instance.

. galaxy_env

cblssh "$1"
