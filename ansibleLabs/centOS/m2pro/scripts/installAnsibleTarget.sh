#!/bin/bash

echo "######################################################################"
echo "############### Ansible Target02 Installation Script #################"
echo "######################################################################"

echo "[+] Starting Installation Script..."

echo "[+] Updating System ..."
yum update
yum upgrade -y

echo "######################################################################"
echo "############ End of Ansible Target02 Installation Script #############"
echo "######################################################################"
