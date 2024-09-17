CREATE DATABASE attisan;
CREATE USER aenychris WITH PASSWORD 'chris_dev_pwd24';
ALTER ROLE aenychris SET client_encoding TO 'utf8';
ALTER ROLE aenychris SET default_transaction_isolation TO 'read committed';
ALTER ROLE aenychris SET timezone TO 'UTC';
GRANT ALL PRIVILEGES ON DATABASE attisan TO aenychris;
