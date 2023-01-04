#!/bin/bash

sudo apt update -y
sudo apt update
sudo apt install apache2
sudo systemctl enable apache2
sudo apt install awscli
timestamp="$(date '+%d%m%Y-%H%M%S')"
s3_bucket="upgrad-anup"
myname="Anup"

cd ~
cd /tmp
tar -cvf ${myname}-httpd-logs-"$(date '+%d%m%Y-%H%M%S')".tar /var/log/apache2/

aws s3 cp /tmp/${myname}-httpd-logs-${timestamp}.tar s3://${s3_bucket}/${myname}-httpd-logs-${timestamp}.tar
size=$(ls -lh "${myname}-httpd-logs-${timestamp}.tar" | awk '{print  $5}')
echo  "<br>httpd-logs &emsp;" ${timestamp} "&emsp; &emsp;&emsp; tar &emsp;" $size >> /var/www/html/inventory.html

sudo su
crontab -e 00 19 * * bash /root/Automation_Project/Automation_Project/automation.sh

esc+ :wq
