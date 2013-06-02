#!/bin/bash

# Usage: ./assign_ip.sh [<instance_name_or_private_ip> [public_ip_address]]
# 
#
# Description: Assign the public ip address specified in galaxy_env as
# GALAXY_IP to the running instance named galaxy_master launched with
# the launch_cm.sh script.

. galaxy_env

instance_name=${1:-$INSTANCE_NAME_RUNTIME_PUBLIC}
ip_address=${2:-$GALAXY_PUBLIC_IP}
id=$(nova list | grep "$instance_name" | awk '{print $2}')

nova add-floating-ip $id $ip_address
