#!/bin/bash

# Usage: ./launch_cm.sh
#
#
# Uses the file latest_snapshot to determine the more recent CloudMan image
# created with snapshot.sh and launches an instance with that image with the
# user data specified by the file user_data.

. galaxy_env

./launch_cm.sh ${INSTANCE_NAME_RUNTIME_DEV}
