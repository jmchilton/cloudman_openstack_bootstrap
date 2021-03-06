#!/bin/bash

# Usage: ./setup_security.sh
#
#
# Description: Setup OpenStack security group as needed by
# CloudMan/Galaxy.

. galaxy_env

# TODO: restrict SSH access to UMN or other
# SSH
nova secgroup-add-rule "$SECGROUP" tcp 22 22 0.0.0.0/0

# HTTP
nova secgroup-add-rule "$SECGROUP" tcp 80 80 0.0.0.0/0

# HTTPS
## You may want to disable this if you are not using nginx over HTTPS.
nova secgroup-add-rule "$SECGROUP" tcp 443 443 0.0.0.0/0

# FTP
nova secgroup-add-rule "$SECGROUP" tcp 20 21 0.0.0.0/0
nova secgroup-add-rule "$SECGROUP" tcp 30000 30100 0.0.0.0/0

# PING
nova secgroup-add-rule "$SECGROUP" icmp -1 -1 0.0.0.0/0


echo "Current rules"
nova secgroup-list-rules "$SECGROUP"

