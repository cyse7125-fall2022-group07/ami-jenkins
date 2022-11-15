#!/bin/bash

sudo apt update
############ Installing Java ##############
sudo apt install openjdk-11-jre -y
############ Installing Node ##############
curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh
nano nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install nodejs
node -v
############ Installing Jenkins ##############
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo apt install jenkins -y
sudo systemctl status jenkins
sudo systemctl is-enabled jenkins
############ Installing Nginx ##############
sudo apt install nginx -y
sudo systemctl status nginx
sudo systemctl enable nginx
sudo ufw app list
############ Installing certbot ##############
sudo snap install core; sudo snap refresh core
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
