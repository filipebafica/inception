CREATE DATABASE wordpress;
CREATE USER 'fbafica'@'localhost' IDENTIFIED BY 'password';
GRANT ALL ON *.* to 'fbafica'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;