
#!/bin/bash

echo "[+] Hello DevOps from New Puppet Node"

echo "######################################################################"
echo "############  Starting Default Installation Script   #################"
echo "######################################################################"

# yum install -y wget

echo "[+] Installing wget utils"

apt-get update
apt-get upgrade -y
apt-get install -y apache2 wget vim

timedatectl set-timezone Africa/Douala
echo "TZ='Africa/Douala'; export TZ" >> ~/.profile
cat /vagrant/scripts/vimrc >> ~/.vimrc


echo "######################################################################"
echo "################ End of Default Installation Script ##################"
echo "######################################################################"
