# odoo
Odoo installation scripts

# Minimum system requirements: 
1 GB RAM, 2 vCPUs, 40 GB SSD
OS: Ubuntu 20.04 LTS

#installation duration: 
15mins

# run this from command line:
sudo wget https://raw.githubusercontent.com/jason-sia/odoo/main/install-odoo16-on-ubuntu20.04LTS.sh; sudo chmod +x ./install-odoo16-on-ubuntu20.04LTS.sh;  ./install-odoo16-on-ubuntu20.04LTS.sh

# switch to venv
source /opt/odoo16/odoo-venv/bin/activate

# Find port open
sudo ss -lptn 'sport = :8069
