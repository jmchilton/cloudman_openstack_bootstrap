#!/bin/bash

# Usage: ./launch_cm.sh
#
#
# Uses the file latest_snapshot to determine the more recent CloudMan image
# created with snapshot.sh and launches an instance with that image with the
# user data specified by the file user_data.

. galaxy_env

instance_name=${1:-$INSTANCE_NAME_RUNTIME}
snapshot_file=${2:-$DEFAULT_SNAPSHOT_FILENAME}
. $snapshot_file

python util/merge_userdata.py "$instance_name"

nova boot --flavor="$FLAVOR" --image="$CLOUDMAN_IMAGE_ID"  --security_groups="$SECGROUP" --key_name="$KEYNAME" --user_data="userdata-$instance_name.merged.yaml"  "$instance_name" 
