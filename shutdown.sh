#!/bin/bash

. galaxy_env

instance_name=${1:-$INSTANCE_NAME_RUNTIME}
echo "Shutting down instance $instance_name"
id=$(nova list | grep "$instance_name" | awk '{print $2}')
if [ "$instance_name" = "$INSTANCE_NAME_RUNTIME" ];
then
    while true; do
        read -p "Are you sure you want to shutdown this instance?" yn
        case $yn in
            [Yy]* ) break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac    
    done
fi
nova delete $id