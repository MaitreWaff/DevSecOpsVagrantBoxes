#!/bin/bash

echo "#######################################################################"
echo "################## Puppet Master Installation Script ##################"
echo "#######################################################################"

echo "[+] Starting Installation Script..."

echo "[+] Updating System ..."
apt update
apt upgrade -y

echo "[+] Installing and Setting up NTP Server ..."
apt install -y vim ntp
systemctl enable ntpd.service
systemctl start ntpd.service
systemctl status ntpd.service

timedatectl set-timezone Africa/Douala
echo "TZ='Africa/Douala'; export TZ" >> ~/.profile
cat /vagrant/scripts/vimrc >> ~/.vimrc

echo "[+] Installing Ansible Controller"
apt install -y ansible ansible-lint

echo "######################################################################"
echo "############# End of Puppet Master Installation Script ###############"
echo "######################################################################"
