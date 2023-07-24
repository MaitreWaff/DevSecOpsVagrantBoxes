#!/bin/bash

echo "######################################################################"
echo "################# Puppet Agent01 Installation Script #################"
echo "######################################################################"

echo "[+] Starting Installation Script..."

# echo "[+] Installing puppet repository"
# rpm -Uvh https://yum.puppet.com/puppet8-release-el-7.noarch.rpm

# echo "[+] Checking succesuful installation"
# rpm -qa | grep puppet
# rpm -qi puppet8-release
# echo "[+] Building Repository Cache"
# yum clean && yum makecache fast

# echo "[+] List Repository"
# yum repolist
# echo "[+] Updating the System"
# yum update -y

# echo "[+] Installing Puppet Agent Service"
# yum install -y puppet-agent

# cat /vagrant/tmpfiles/puppetagent01.conf >> /etc/puppetlabs/puppet/puppet.conf

# echo "[+] Starting, Enabling and Checking Puppet Agent Service"
# systemctl status puppet.service
# systemctl start puppet.service
# systemctl enable puppet.service
# systemctl status puppet.service

echo "######################################################################"
echo "############# End of Puppet Agent01 Installation Script ##############"
echo "######################################################################"
