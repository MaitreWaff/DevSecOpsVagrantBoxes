#!/bin/bash

echo "[+] Hello DevOps from New Puppet Node"

echo "######################################################################"
echo "############  Starting Default Installation Script   #################"
echo "######################################################################"

# echo "[+] Installing wget utils"
# apt update -y
# apt install -y wget vim
echo "[+] Setting Timezone"
timedatectl set-timezone Africa/Douala
echo "TZ='Africa/Douala'; export TZ" >> ~/.profile
cat /vagrant/scripts/vimrc >> ~/.vimrc

echo "######################################################################"
echo "################ End of Default Installation Script ##################"
echo "######################################################################"
