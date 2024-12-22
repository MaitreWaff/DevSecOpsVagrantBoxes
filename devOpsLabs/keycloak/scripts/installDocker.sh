#!/bin/bash

echo "#################################################################"
echo "################## Grafana Installation Script ##################"
echo "#################################################################"

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


# Removes Docker

for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo apt-get install -y -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Installs Docker
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Adding Docker group to Vagrant user
sudo usermod -aG docker vagrant


# Starts Loki
docker run --name loki -d -v $(pwd):/mnt/config -p 3100:3100 grafana/loki:2.9.4 -config.file=/mnt/config/loki-config.yaml

# Starts Promtail
docker run --name promtail -d -v $(pwd):/mnt/config -v /var/log:/var/log --link loki grafana/promtail:2.9.4 -config.file=/mnt/config/promtail-config.yaml


# # Download Docker Script
# curl -fsSL https://get.docker.com -o get-docker.sh

# # Installs Docker
# sudo sh get-docker.sh


# # Tests Docker

echo "################################################################"
echo "############# End of Grafana Installation Script ###############"
echo "################################################################"
