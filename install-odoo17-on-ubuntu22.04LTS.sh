#!/bin/sh
# installing odoo env 17 dev
#sudo apt update
#sudo apt upgrade -y

git clone https://github.com/odoo/odoo.git

python3 --version

sudo apt-get update -y

sudo apt-get install python3-pip -y

pip3 --version

sudo apt install postgresql postgresql-client -y

sudo chown -R ubuntu:ubuntu /home/ubuntu/.ssh

sudo chmod 700 /home/ubuntu/.ssh

#sudo -u postgres createuser -d -R -S $USER

# create user
#sudo useradd -m -d /opt/odoo17 -U -r -s /bin/bash odoo17
#sudo su - postgres -c "createuser -s odoo17"

sudo -u postgres createuser -d -R -S $USER
createdb $USER
#createdb odoo17

# install html to pdf converter
#sudo wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.focal_amd64.deb
#sudo apt install ./wkhtmltox_0.12.5-1.focal_amd64.deb -y
sudo wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.focal_amd64.deb
sudo apt install ./wkhtmltox_0.12.6-1.focal_amd64.deb -y


cd odoo

sudo /home/ubuntu/odoo/setup/debinstall.sh

#python3 odoo-bin --addons-path=addons -d odoo -i base

# setup odoo config 
sudo wget https://raw.githubusercontent.com/jason-sia/odoo/main/odoo17.conf -P /home/ubuntu/odoo


# create odoo service /etc/systemd/system/odoo.service
#sudo adduser --system --home=/opt/odoo --group odoo
#sudo mkdir /etc/odoo
#sudo chown -R odoo:odoo /opt/odoo /etc/odoo

#sudo wget https://raw.githubusercontent.com/jason-sia/odoo/main/odoo.service -P /etc/systemd/system
#sudo systemctl daemon-reload
#sudo systemctl enable odoo


#setup nginx
#sudo apt-get install python-pypdf2 -y
sudo apt-get install python3-pypdf2 -y

sudo apt install nginx -y 
sudo rm -rf /etc/nginx/sites-available/default
sudo rm -rf /etc/nginx/sites-enabled/default
sudo wget https://raw.githubusercontent.com/jason-sia/odoo/main/odoo.conf -P /etc/nginx/sites-available
sudo ln -s /etc/nginx/sites-available/odoo.conf /etc/nginx/sites-enabled/odoo.conf
sudo nginx -t

sudo apt install python3-gevent -y
sudo mkdir /home/ubuntu/odoo/odoo-custom-addons

# run the servers
sudo service nginx stop
sudo service nginx start




#python3 /home/ubuntu/odoo/odoo-bin --addons-path=/home/ubuntu/odoo/addons -d odoo -i base
python3 /home/ubuntu/odoo/odoo-bin --addons-path=/home/ubuntu/odoo/addons -d odoo_db -c /home/ubuntu/odoo/odoo17.conf

#sudo runuser -l odoo16 -c '/home/odoo16/odoo/odoo-bin  -c /etc/odoo16.conf -d odoo_db' 

