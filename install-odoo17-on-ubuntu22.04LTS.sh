#!/bin/sh
# installing odoo env 17
sudo apt update
sudo apt install -y postgresql
wget -O - https://nightly.odoo.com/odoo.key | sudo apt-key add -
echo "deb http://nightly.odoo.com/17.0/nightly/deb/ ./" | sudo tee /etc/apt/sources.list.d/odoo.list
sudo apt update
sudo apt upgrade -y

# create odoo service /etc/systemd/system/odoo.service
sudo wget https://raw.githubusercontent.com/jason-sia/odoo/main/odoo.service -P /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable odoo
sudo systemctl start odoo
sudo systemctl status odoo


#setup nginx
#sudo apt-get install python-pypdf2 -y
#sudo apt-get install python3-pypdf2 -y
sudo apt install nginx -y 
sudo rm -rf /etc/nginx/sites-available/default
sudo rm -rf /etc/nginx/sites-enabled/default
sudo wget https://raw.githubusercontent.com/jason-sia/odoo/main/odoo.conf -P /etc/nginx/sites-available
sudo ln -s /etc/nginx/sites-available/odoo.conf /etc/nginx/sites-enabled/odoo.conf
sudo nginx -t

# run the servers
sudo service nginx stop
sudo service nginx start

