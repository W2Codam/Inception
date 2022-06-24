-- Create a new databse with name wordpress
CREATE DATABASE IF NOT EXISTS wordpress;

-- Add user
CREATE USER 'balls'@'%';
SET PASSWORD FOR 'balls'@'%' = PASSWORD('balls1234'); -- Probs dont wanna do this lol

-- Add root permisions for that database to the user
GRANT ALL PRIVILEGES ON wordpress.* TO 'balls'@'%' IDENTIFIED BY 'balls1234';
GRANT ALL ON wordpress.* to 'balls'@'%' IDENTIFIED BY 'balls1234';
-- See https://chartio.com/resources/tutorials/how-to-grant-all-privileges-on-a-database-in-mysql/

FLUSH PRIVILEGES; -- Apply the priviliges

CREATE USER 'root'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;

-- See https://stackoverflow.com/questions/5016505/mysql-grant-all-privileges-on-database
-- The GRANT OPTION privilege enables you to give to other users or remove from other users those privileges that you yourself possess.

FLUSH PRIVILEGES; -- Apply the priviliges