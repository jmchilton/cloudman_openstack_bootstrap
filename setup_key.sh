#!/bin/bash

# Usage: ./setup_key.sh
#
#
# Descriptions creates a key pair (if needed) and registers it with
# OpenStack.

. galaxy_env

if [ ! -e "$KEYFILE" ];
then
    ssh-keygen -t dsa -f "$KEYFILE"
fi
nova keypair-add --pub_key "$KEYFILE.pub" "$KEYNAME"
