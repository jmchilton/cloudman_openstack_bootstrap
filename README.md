This project contains a collection of scripts and config files I am
using to configure CloudMan for OpenStack.

This absolutely is NOT a turn-key solution! These scripts are highly
tailored to the workflow I am developing and reflect some of
eccentricities of MSI's current cloud setup (namely no object (swift)
or block storage (nova-volume) available). To accommodate this, I have
augmented CloudMan to allow specifing Galaxy options dynamically from
user data (so a database external to the cloud can be configured) and
run arbitrary commands pre-setup (that I use to mount NFS storage
again available from outside the OpenStack cloud). More standard
CloudMan setups will place Galaxy and tools on cloud block storage, my
current setup bakes these right into the cloud images (installing them
to /opt/galaxy instead of /mnt/galaxyTools).

These scripts are so tailored to this setup, that they this is a
worthless project to you. Hopefully though it does serve to document
how to tweak CloudMan and CloudBioLinux for some alternative
scenarios. Besides, this page
http://wiki.g2.bx.psu.edu/CloudMan/OpenStack remain empty, so this is
what you get :).

* Download these scripts and CloudBioLinux.

    % git clone git://github.com/jmchilton/cloudman_openstack_bootstrap.git
    % cd cloudman_openstack_bootstrap
    % git clone git://github.com/chapmanb/cloudbiolinux.git

* Populate galaxy_env with your connection parameters.

    % cp galaxy_env.sample galaxy_env
    % vim galaxy_env

  Also see env_defaults for additional parameters you can tweak.

* Populate fabricrc.txt with your CloudBioLinux install options.

    % cp fabricrc.txt.sample fabricrc.txt
    % vim fabricrc.txt

* Populate user_data with your CloudMan launch options.

    % cp user_data.template user_data
    % vim user_data

* Setup a VPN connection into your OpenStack VPN (optional and outside
  the scope of this document.)

* Setup an OpenStack keypair. 

    % ./setup_key.sh

* Setup your OpenStack security group.

    % ./setup_security.sh

* Launch a stock Ubuntu 12.04 instance.

    % ./launch_initial.sh

* Install CloudMan (via CloudBioLinux).

    % ./install_cloudman.sh

* Take a snapshot of this CloudMan instance.

    % ./snapshot.sh

* Launch CloudMan.

    % ./launch_cm.sh

* Assign it a public IP address.

    % ./assign_ip.sh

