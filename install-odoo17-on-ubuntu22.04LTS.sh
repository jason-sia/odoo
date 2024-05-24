#!/bin/sh
# installing odoo env 17
sudo apt update
sudo apt upgrade -y

sudo apt install -y postgresql
#pg_ctlcluster 12 main start

wget -O - https://nightly.odoo.com/odoo.key | sudo apt-key add -
echo "deb http://nightly.odoo.com/17.0/nightly/deb/ ./" | sudo tee /etc/apt/sources.list.d/odoo.list
sudo apt update
sudo apt upgrade -y

#install Python 3.1
sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install -y python3.10 python3.10-venv python3.10-dev

#install odoo
sudo apt install -y odoo
sudo wget https://raw.githubusercontent.com/jason-sia/odoo/main/odoo17.conf -P /etc/odoo
sudo mv /etc/odoo/odoo17.conf /etc/odoo/odoo.conf 

# create odoo service /etc/systemd/system/odoo.service
#sudo adduser --system --home=/opt/odoo --group odoo
#sudo mkdir /etc/odoo
#sudo chown -R odoo:odoo /opt/odoo /etc/odoo

sudo wget https://raw.githubusercontent.com/jason-sia/odoo/main/odoo.service -P /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable odoo


#setup nginx
#sudo apt-get install python-pypdf2 -y
#sudo apt-get install python3-pypdf2 -y
sudo apt install nginx -y 
sudo rm -rf /etc/nginx/sites-available/default
sudo rm -rf /etc/nginx/sites-enabled/default
sudo wget https://raw.githubusercontent.com/jason-sia/odoo/main/odoo.conf -P /etc/nginx/sites-available
sudo ln -s /etc/nginx/sites-available/odoo.conf /etc/nginx/sites-enabled/odoo.conf
sudo nginx -t

sudo mkdir /opt/odoo/odoo-custom-addons

# run the servers
sudo service nginx stop
sudo service nginx start
sudo systemctl start odoo
sudo systemctl status odoo

