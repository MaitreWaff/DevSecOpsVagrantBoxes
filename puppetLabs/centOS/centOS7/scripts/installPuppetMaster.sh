#!/bin/bash

echo "#######################################################################"
echo "################## Puppet Master Installation Script ##################"
echo "#######################################################################"

# wget https://yum.puppet.com/puppet8-release-el-7.noarch.rpm
# rpm -U puppet8-release-el-7.noarch.rpm
# rpm -Uvh https://yum.puppet.com/puppet7-release-el-7.noarch.rpm

echo "[+] Starting Installation Script..."

echo "[+] Installing and Setting up NTP Server ..."
yum install -y ntp
systemctl enable ntpd.service
systemctl start ntpd.service
systemctl status ntpd.service
timedatectl set-timezone Africa/Douala
echo "TZ='Africa/Douala'; export TZ" >> ~/.profile

echo "[+] Installing puppet repository"
rpm -Uvh https://yum.puppet.com/puppet8-release-el-7.noarch.rpm

echo "[+] Checking succesuful installation"
rpm -qa | grep puppet
rpm -qi puppet8-release
echo "[+] Building Repository Cache"
yum clean && yum makecache fast

echo "[+] List Repository"
yum repolist
echo "[+] Updating the System"
yum update -y

echo "[+] Installing Puppet Server Service"
yum install -y puppetserver

cat /vagrant/tmpfiles/puppetmaster01.conf >> /etc/puppetlabs/puppet/puppet.conf
cp /vagrant/puppet.conf/site.pp /etc/puppetlabs/code/environments/production/manifests/site.pp
cp /vagrant/puppet.conf/ntpdemo.pp /etc/puppetlabs/code/environments/production/manifests/ntpdemo.pp

echo "[+] Starting, Enabling and Checking Puppet Server Service"
systemctl status puppetserver.service
systemctl start puppetserver.service
systemctl enable puppetserver.service
systemctl status puppetserver.service

echo "######################################################################"
echo "############# End of Puppet Master Installation Script ###############"
echo "######################################################################"
