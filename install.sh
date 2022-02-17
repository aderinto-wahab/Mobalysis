#!/bin/bash

# To clone into current directory
sudo su -c 'git clone https://github.com/aderinto-wahab/Mobalysis.git' - mob_app_user

#To install python
sudo apt-get install python3 -y

# To install pip
sudo apt install python3-pip -y

# To install django
pip install django==3.0.0

# To add environment variables to mob_app_user bashrc file
sudo su -c 'echo -e "#Adding environment variables to bashrc file\nexport DBNAME='Mobalysis'\nexport DBUSER='mob_db_user'\nexport DBPASS='mob_db_pass'\nexport DBHOST='localhost'\nexport DBPORT='5432'" >> .bashrc' - mob_app_user

# To execute bashrc files so that the variables are activated in the mob_app_user's environment for the current session
sudo su -c 'source .bashrc' - mob_app_user

#To install python virtual environment globally so that it can be used by any user
sudo apt-get install python3-venv -y

#To setup vitual environment called  env
sudo su -c 'python3 -m venv env' - mob_app_user

#To activate the virtual environment
sudo su -c 'source env/bin/activate' - mob_app_user

#making new migrations into database
python3 /home/mob_app_user/Mobalysis/backend/manage.py makemigrations

#making new migrations into database
python3 /home/mob_app_user/Mobalysis/backend/manage.py makemigrations