#!/usr/bin/env bash

apt-get update
apt-get dist-upgrade -y

/sbin/blockdev --setra 2048 /dev/sda
fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo "/swapfile none swap sw 0 0" >> /etc/fstab

apt-get install make ntp sysstat pstack mcelog tzdata dialog
dpkg -i /home/vagrant/vertica.deb

echo "Installing Vertica"
/opt/vertica/sbin/install_vertica --record-config /home/vagrant/vertica.cfg --hosts 127.0.0.1 --license CE --accept-eula --dba-user-password pass --failure-threshold FAIL
/opt/vertica/sbin/install_vertica --config-file /home/vagrant/vertica.cfg --failure-threshold FAIL
echo "Creating database 'localdev'"
su - dbadmin -c "/opt/vertica/bin/admintools -t create_db -d localdev -s 127.0.0.1"
