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

echo "[+] Installing Grafana"

sudo apt-get install -y apt-transport-https software-properties-common wget
sudo mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com beta main" | sudo tee -a /etc/apt/sources.list.d/grafana.list

# Updates the list of available packages
sudo apt-get update

# Installs the latest OSS release:
sudo apt-get install -y grafana

# Installs the latest Enterprise release:
sudo apt-get install -y grafana-enterprise

# Starts Grafana Server
systemctl start grafana-server.service

# Enables Grafana Server
systemctl enable grafana-server.service


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
