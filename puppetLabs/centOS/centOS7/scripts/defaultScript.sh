#!/bin/bash

echo "[+] Hello DevOps from New Puppet Node"

echo "######################################################################"
echo "############  Starting Default Installation Script   #################"
echo "######################################################################"

# yum install -y wget

echo "[+] Installing wget utils"
yum install -y wget vim

# yum install httpd -y
# systemctl enable httpd.service
# systemctl start httpd.service
# systemctl status httpd.service
# echo "
# <html>
# <head>
# </head>
# <body>
# 	<h1>Hello MaitreWaff!</h1>
# </body>
# </html>
# " > /var/www/html/index.html

echo "######################################################################"
echo "################ End of Default Installation Script ##################"
echo "######################################################################"
