#!/bin/bash

# Usage: ./snapshot_and_test.sh [<instance_name_or_ip>]
#
#
# Creates a snapshot using snapshot.sh and then launches a new
# dev instance.

. galaxy_env

./snapshot.sh "$@" && ./launch_cm_dev.sh
