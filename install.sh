#!/bin/bash

# To clone into current directory
sudo su -c 'git clone https://github.com/aderinto-wahab/Mobalysis.git' - mob_app_user



# To add environment variables to mob_app_user bashrc file
sudo su -c 'echo -e "#Adding environment variables to bashrc file\nexport DBNAME='Mobalysis'\nexport DBUSER='mob_db_user'\nexport DBPASS='mob_db_pass'\nexport DBHOST='localhost'\nexport DBPORT='5432'" >> .bashrc' - mob_app_user

# To execute bashrc files so that the variables are activated in the mob_app_user's environment for the current session
sudo su -c 'source .bashrc' - mob_app_user


#To setup vitual environment called  env
sudo su -c 'python3 -m venv env' - mob_app_user

#To activate the virtual environment
sudo su -c 'source env/bin/activate' - mob_app_user

#To install the application packages in virtual environment
sudo -u mob_app_user bash -c 'cd /home/mob_app_user/ && source /home/mob_app_user/.env/bin/activate && pip3 install -r /home/mob_app_user/Mobalysis/backend/requirements.txt'

#making new migrations into database
python3 /home/mob_app_user/Mobalysis/backend/manage.py makemigrations
python3 /home/mob_app_user/Mobalysis/backend/manage.py migrate
