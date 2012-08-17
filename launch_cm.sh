#!/bin/bash

# Usage: ./launch_cm.sh
#
#
# Uses the file latest_snapshot to determine the more recent CloudMan image
# created with snapshot.sh and launches an instance with that image with the
# user data specified by the file user_data.

. galaxy_env
. latest_snapshot

if [ ! -e user_data ];
then
    cp user_data.template user_data
fi
sed -i  -e "s/EC2_ACCESS_KEY/$EC2_ACCESS_KEY/" user_data
sed -i  -e "s/EC2_SECRET_KEY/$EC2_SECRET_KEY/" user_data

nova boot --flavor="$FLAVOR" --image="$CLOUDMAN_IMAGE_ID"  --security_groups="$SECGROUP" --key_name="$KEYNAME" --user_data=user_data  "$INSTANCE_NAME_RUNTIME"
