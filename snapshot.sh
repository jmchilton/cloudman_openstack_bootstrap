#!/bin/bash

# Usage: ./snapshot.sh [<instance_name_or_ip> [<snapshot_file>]]
#
#
# Creates a snapshot of the instance running and named
# cloudman_bootstrap and writes its UUID to the the file
# latest_snapshot. This instance can then be launched and cloudman ran
# by executing ./launch_cm.sh.

. galaxy_env

instance_name=${1:-$INSTANCE_NAME_SETUP}
snapshot_file=${2:-$DEFAULT_SNAPSHOT_FILENAME}

id=$(nova list | grep "$instance_name" | awk '{print $2}')
thedate=`date +%F_%H%M%S`
name=${3:-"cloudman_$thedate"}
nova image-create --poll $id $name

image_id=$(nova image-list | grep "$name" | awk '{print $2}')
echo "export CLOUDMAN_IMAGE_ID=$image_id" > $snapshot_file
