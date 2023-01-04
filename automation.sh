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

