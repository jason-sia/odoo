#!/bin/sh
# installing odoo env dev
sudo apt update
sudo apt upgrade -y

sudo apt install postgresql -y
sudo apt install postgresql-server-dev-12 -y 
sudo apt install build-essential -y
sudo apt install python3-pillow -y
sudo apt install python3-lxml -y
sudo apt install python3-dev -y
sudo apt install python3-pip -y
sudo apt install python3-setuptools -y
sudo apt install npm -y 
sudo apt install nodejs -y
sudo apt install git -y
sudo apt install gdebi -y 
sudo apt install libldap2-dev -y 
sudo apt install libsasl2-dev -y
sudo apt install libxml2-dev -y
sudo apt install python3-wheel -y 
sudo apt install python3-venv -y
sudo apt install libxslt1-dev -y
sudo apt install nodeless -y
sudo apt install libjpeg-dev -y 
sudo pg_ctlcluster 12 main start

#nginx
sudo apt install nginx -y 
sudo rm -rf /etc/nginx/sites-available/default
sudo rm -rf /etc/nginx/sites-enabled/default
sudo wget https://raw.githubusercontent.com/jason-sia/odoo/main/odoo.conf -P /etc/nginx/sites-available
sudo ln -s /etc/nginx/sites-available/odoo.conf /etc/nginx/sites-enabled/odoo.conf
sudo nginx -t

# create user
sudo useradd -m -d /opt/odoo16 -U -r -s /bin/bash odoo16
sudo su - postgres -c "createuser -s odoo16"

# install html to pdf converter
sudo wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.focal_amd64.deb
sudo apt install ./wkhtmltox_0.12.5-1.focal_amd64.deb -y

#sudo su - odoo16
#git clone https://www.github.com/odoo/odoo --depth 1 --branch 16.0 /opt/odoo16/odoo
sudo runuser -l odoo16 -c 'ls -l'
sudo runuser -l odoo16 -c 'git clone https://www.github.com/odoo/odoo --depth 1 --branch 16.0 /opt/odoo16/odoo'

 
# create virtual environment
#cd /opt/odoo16 
#python3 -m venv odoo-venv
sudo runuser -l odoo16 -c 'cd /opt/odoo16'
sudo runuser -l odoo16 -c 'python3 -m venv odoo-venv'

#source odoo-venv/bin/activate
sudo runuser -l odoo16 -c 'source odoo-venv/bin/activate'

#pip3 install wheel 
#pip3 install -r odoo/requirements.txt
sudo runuser -l odoo16 -c 'pip3 install wheel'
sudo runuser -l odoo16 -c 'cd /'
sudo runuser -l odoo16 -c 'pip3 install -r /opt/odoo16/odoo/requirements.txt'

# run it
#cd /opt/odoo16/odoo
#ls
#./odoo-bin
#sudo runuser -l odoo16 -c 'cd /opt/odoo16/odoo'
#sudo runuser -l odoo16 -c 'ls'
#sudo runuser -l odoo16 -c './odoo-bin'
sudo runuser -l odoo16 -c '/opt/odoo16/odoo/odoo-bin'

