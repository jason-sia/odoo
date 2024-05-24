#!/bin/sh
# installing odoo env 17
sudo apt update
sudo apt install -y postgresql
wget -O - https://nightly.odoo.com/odoo.key | sudo apt-key add -
echo "deb http://nightly.odoo.com/14.0/nightly/deb/ ./" | sudo tee /etc/apt/sources.list.d/odoo.list
sudo apt update
sudo apt upgrade -y

# create odoo service /etc/systemd/system/odoo.service
sudo wget https://raw.githubusercontent.com/jason-sia/odoo/main/odoo.service -P /etc/systemd/system
#sudo systemctl daemon-reload
#sudo systemctl enable --now odoo17
#sudo systemctl status odoo17


#setup nginx
sudo apt-get install python-pypdf2 -y
sudo apt-get install python3-pypdf2 -y
sudo apt install nginx -y 
sudo rm -rf /etc/nginx/sites-available/default
sudo rm -rf /etc/nginx/sites-enabled/default
sudo wget https://raw.githubusercontent.com/jason-sia/odoo/main/odoo.conf -P /etc/nginx/sites-available
sudo ln -s /etc/nginx/sites-available/odoo.conf /etc/nginx/sites-enabled/odoo.conf
sudo nginx -t
#sudo service nginx stop
#sudo service nginx start

# setup odoo config 
#sudo wget https://raw.githubusercontent.com/jason-sia/odoo/main/odoo17.conf -P /etc


# create user
#sudo useradd -m -d /opt/odoo17 -U -r -s /bin/bash odoo17
#sudo su - postgres -c "createuser -s odoo17"

# install html to pdf converter
#sudo wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.focal_amd64.deb
#sudo apt install ./wkhtmltox_0.12.5-1.focal_amd64.deb -y

#sudo su - odoo17
#git clone https://www.github.com/odoo/odoo --depth 1 --branch 17.0 /opt/odoo17/odoo
#sudo runuser -l odoo17 -c 'ls -l'
#sudo runuser -l odoo17 -c 'git clone https://www.github.com/odoo/odoo --depth 1 --branch 17.0 /opt/odoo17/odoo'

 
# create virtual environment
#cd /opt/odoo17 
##python3 -m venv odoo-venv
#sudo runuser -l odoo17 -c 'cd /opt/odoo17'
#sudo runuser -l odoo17 -c 'python3 -m venv odoo-venv'

#source odoo-venv/bin/activate
#sudo runuser -l odoo17 -c 'source /opt/odoo17/odoo-venv/bin/activate'

#pip3 install wheel 
#pip3 install -r odoo/requirements.txt
#sudo apt-get install python3-pypdf2 -y
#sudo runuser -l odoo17 -c 'pip3 install python3-pypdf2'
#sudo runuser -l odoo17 -c 'pip3 install wheel'
#sudo runuser -l odoo17 -c 'cd /'
#sudo runuser -l odoo17 -c 'pip3 install -r /opt/odoo17/odoo/requirements.txt'
#sudo runuser -l odoo17 -c 'pip install PyPDF2'
# sudo pip install PyPDF2

#sudo runuser -l odoo17 -c 'mkdir /opt/odoo17/odoo-venv/log'
#sudo runuser -l odoo17 -c 'mkdir /opt/odoo17/odoo-venv/custom'
#sudo runuser -l odoo17 -c 'mkdir /opt/odoo17/odoo-venv/custom/addons'
#sudo runuser -l odoo17 -c 'wget https://raw.githubusercontent.com/jason-sia/odoo/main/odoo17.conf -P /etc'

#sudo apt-get install python-pypdf2 -y
#sudo apt-get install python3-pypdf2 -y

 
#sudo mkdir /opt/odoo17/odoo-custom-addons

# run it
#cd /opt/odoo17/odoo
#ls
#./odoo-bin
#sudo runuser -l odoo17 -c 'cd /opt/odoo17/odoo'
#sudo runuser -l odoo17 -c 'ls'
#sudo runuser -l odoo17 -c './odoo-bin'
#sudo runuser -l odoo17 -c '/opt/odoo17/odoo/odoo-bin'

# run the servers
sudo service nginx stop
sudo service nginx start


#sudo runuser -l odoo17 -c '/opt/odoo17/odoo/odoo-bin  -c /etc/odoo17.conf -d odoo_db' 
#sudo runuser -l odoo17 -c '/opt/odoo17/odoo/odoo-bin -d odoo_db --init=all --load-language=en_US --without-demo=all --db-filter=^odoo_db$ --save' 

#./odoo-bin -c /etc/odoo-server.conf
