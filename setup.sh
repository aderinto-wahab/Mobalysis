#!bin/bash

#Getting updates and upgrading the server
sudo apt-get update -y  && sudo apt-get upgrade -y

#installing postgresql
sudo apt-get install postgresql postgresql-contrib -y


#Creating database
sudo -u postgres psql -c "create database mob_db;"

#Creating user
sudo -u postgres psql -c "create user mob_db_user; alter user mob_db_user with encrypted password 'mob_db_password'; grant all privileges on database mob_db to mob_db_user"

#Adding user named "mob_app_user"
sudo adduser mob_app_user

#Enter user's password and credentials

#Installing home directory for "mob_app_user"
sudo mkhomedir_helper mob_app_user

#Switching to "mob_app_user"
sudo su -  mob_app_user
