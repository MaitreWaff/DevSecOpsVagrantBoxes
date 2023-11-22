#!/bin/bash

sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt install apache2 -y
sudo systemctl enable apache2 && sudo systemctl start apache2
sudo systemctl status apache2
sudo apt install openjdk-11-jdk -y
java --version

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo su -
sudo apt update -y
sudo apt install jenkins -y
sudo systemctl status jenkins
cd /etc/apache2/sites-available/
sudo vim jenkins.conf

cat > jenkins.conf <<-EOF
<Virtualhost *:80>
    ServerName        yourdomain.com
    ProxyRequests     Off
    ProxyPreserveHost On
    AllowEncodedSlashes NoDecode

    <Proxy http://localhost:8080/*>
      Order deny,allow
      Allow from all
    </Proxy>

    ProxyPass         /  http://localhost:8080/ nocanon
    ProxyPassReverse  /  http://localhost:8080/
    ProxyPassReverse  /  http://yourdomain.com/
</Virtualhost>
EOF
cd
sudo a2ensite jenkins
sudo a2enmod proxy
sudo a2enmod proxy_http
sudo a2enmod headers
sudo systemctl restart apache2
# sudo systemctl status apache2
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
