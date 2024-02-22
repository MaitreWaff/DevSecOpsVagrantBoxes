#!/bin/bash

echo "####################################################################"
echo "############### Ansible Target Installation Script #################"
echo "####################################################################"

echo "[+] Starting Installation Script..."

echo "[+] Updating System ..."
apt update
apt upgrade -y

echo "####################################################################"
echo "############ End of Ansible Target Installation Script #############"
echo "####################################################################"