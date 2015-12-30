CREATE DATABASE mybaseball;
SHOW DATABASES;
SELECT * FROM mysql.USER;
DROP USER guest@localhost;
DROP USER guest@'%';
CREATE USER guest@localhost IDENTIFIED BY 'aOVG1L2xDC';
GRANT SELECT ON mybaseball.* TO guest@localhost;
SHOW GRANTS FOR guest@localhost;

USE mybaseball;
SHOW TABLES;