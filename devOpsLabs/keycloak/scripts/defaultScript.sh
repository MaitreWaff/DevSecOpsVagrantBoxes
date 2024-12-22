#!/bin/bash

echo "[+] Hello DevOps from New Ansible Node"

echo "######################################################################"
echo "############  Starting Default Installation Script   #################"
echo "######################################################################"

echo "[+] Installing SSH Keys"

# echo "[+] Installing SSH Keys for the Vagrant User"
# rm -rf /home/vagrant/.ssh/*
# ssh-keygen -t rsa -b 4096 -f /home/vagrant/.ssh/id_rsa -q -N ""

echo "[+] Changing Ownership of the SSH Keys for the Vagrant User"
chown -R vagrant:vagrant /home/vagrant/.ssh/

echo "[+] Installing SSH Keys for the Root User"
rm -rf ~/.ssh/*
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -q -N ""
# yum install -y wget

# echo "[+] Installing wget utils"
# yum install -y wget vim
# timedatectl set-timezone Africa/Douala
# echo "TZ='Africa/Douala'; export TZ" >> ~/.profile
# cat /vagrant/scripts/vimrc >> ~/.vimrc

echo "######################################################################"
echo "################ End of Default Installation Script ##################"
echo "######################################################################"
