# Attisan
Attisan is a web-based application that gives artisans the opportunity to sell their skills and expertise and clients can hire the best hands from a pool of artisans.

## Installation
run the `env_setup.sh` script to install all necesarry dependents and requirements. Ensure to open the database_setup.sql file and edit to input name of database, your username and password for the database setup before running `env_setup.sh`.

## Usage
To deploy the application localy cd into the folder `Attisan/portproj` and run the command
`python3 manage.py runserver`. This will deploy the application on your localcomputer with the localhost as the binding ip to usually port 8000. That's `localhost:8000'. Wsgi servers such as gunicorn is required for production cases