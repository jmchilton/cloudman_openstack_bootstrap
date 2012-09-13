#!/bin/bash

. galaxy_env

instance_name=${2:-INSTANCE_NAME_SETUP}
snapshot_file=latest_min_snapshot
thedate=`date +%F_%H%M%S`
name=${1:-"cbl_min"}
name="${name}_$thedate"

./snapshot.sh $instance_name $snapshot_file $name
