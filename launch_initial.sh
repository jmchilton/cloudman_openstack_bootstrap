#!/bin/bash

# Usage: ./launch_initial.sh [name] [image_id] [flavor]
#
#
# Launches a fresh Ubuntu instance with the parameters defined in galaxy_env.
# Ensure a secuirty group and keypair have been registered (using
# setup_security.sh and setup_key.sh for instance).

. galaxy_env

instance_name=${1:-$INSTANCE_NAME_SETUP}
image_id=${2:-$UBUNTU_IMAGE_ID}
flavor=${3:-$FLAVOR}

nova boot --flavor="$flavor" --image="$image_id" --security_groups="$SECGROUP" --key_name="$KEYNAME" "$instance_name"
