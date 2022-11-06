#!/bin/bash

sudo apt update
############ Installing Java ##############
sudo apt install openjdk-11-jre -y
############ Installing Jenkins ##############
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo apt install jenkins -y
sudo systemctl status jenkins
sudo systemctl is-enabled jenkins
############ Installing Jenkins Plugins ##############
sudo java -jar jenkins-cli.jar -s http://localhost:8080/ enable-plugin PLUGIN
############ Installing Nginx ##############
sudo apt install nginx -y
sudo systemctl status nginx
sudo systemctl enable nginx
sudo ufw app list
############ Installing certbot ##############
sudo snap install core; sudo snap refresh core
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
