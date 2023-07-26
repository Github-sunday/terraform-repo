#!/bin/bash

sudo yum update -y
sudo yum install ruby -y
sudo yum install wget -y
wget https://aws-codedeploy-eu-west-2.s3.eu-west-2.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
sudo service codedeploy-agent start

sudo yum install httpd -y
systemctl start httpd
systemctl enable httpd