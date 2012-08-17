#!/bin/bash

# Usage: ./launch_initial.sh
#
#
# Launches a fresh Ubuntu instance with the parameters defined in galaxy_env.
# Ensure a secuirty group and keypair have been registered (using
# setup_security.sh and setup_key.sh for instance).

. galaxy_env

nova boot --flavor="$FLAVOR" --image="$UBUNTU_IMAGE_ID" --security_groups="$SECGROUP" --key_name="$KEYNAME" "$INSTANCE_NAME_SETUP"
