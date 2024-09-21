#!/usr/bin/env bash

# 1. install postgresql
sudo apt-get install wget ca-certificates
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
sudo apt-get update
sudo apt-get install postgresql
sudo service postgesql start

# 2. run database setup
# check if postgresql is started
# before running setup else wait for some seconds
# Note: change username and password to yours in database_setup.sql

sleep 20
cat database_setup.sql | sudo -u postgres psql

# 3. install python requirements

python3 -m pip3 install -r requirements.txt

# 4. make migrations to create tables

cd portproj
python3 manage.py makemigrations
python3 manage.py migrate

# 5. Start server
python3 manage.py runserver
