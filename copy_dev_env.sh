#!/bin/bash

# Usage: ./copy_dev_env.sh <ip_address>
#
#
# Copy your .ssh directory and .hgrc username information to remote
# Galaxy account so you can develop and commit changes to bitbucket
# from there. It is not actually a good idea to copy your .ssh
# directory around like this so be careful!

. galaxy_env

username_line=`grep username $HOME/.hgrc`
cblscp -r ~/.ssh "$1":
cblssh "$1" /bin/bash -c "echo '[ui]' > .hgrc; echo \"$username_line\" >> .hgrc"
cblssh "$1" "sudo cp -r ~/.ssh .hgrc ~galaxy; sudo chown -R galaxy:galaxy ~galaxy/.ssh ~galaxy/.hgrc"
