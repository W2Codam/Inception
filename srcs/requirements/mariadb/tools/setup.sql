-- Create a new databse with name wordpress
CREATE DATABASE IF NOT EXISTS wordpress;

-- Add root user
CREATE USER 'balls'@'%';
SET PASSWORD FOR 'balls'@'%' = PASSWORD('balls1234'); -- Probs dont wanna do this lol

-- Add root permisions for that database to the user
-- See https://chartio.com/resources/tutorials/how-to-grant-all-privileges-on-a-database-in-mysql/
GRANT ALL PRIVILEGES ON wordpress.* TO 'balls'@'%' IDENTIFIED BY 'balls1234';
GRANT ALL ON wordpress.* to 'balls'@'%' IDENTIFIED BY 'balls1234';
FLUSH PRIVILEGES; -- Apply the priviliges


-- The GRANT OPTION privilege enables you to give to other users or remove from other users those privileges that you yourself possess.
-- See https://stackoverflow.com/questions/5016505/mysql-grant-all-privileges-on-database

-- Add regular user
CREATE USER 'bruh'@'%';
SET PASSWORD FOR 'bruh'@'%' = PASSWORD('balls1234');

GRANT ALL PRIVILEGES ON wordpress.* TO 'bruh'@'%' IDENTIFIED BY 'balls1234';
GRANT ALL ON wordpress.* to 'bruh'@'%' IDENTIFIED BY 'balls1234';
FLUSH PRIVILEGES; -- Apply the priviliges
