CREATE DATABASE IF NOT EXISTS `db-aparaty`;
CREATE USER IF NOT EXISTS `268513`@`localhost` IDENTIFIED BY 'mateusz513';
USE `db-aparaty`;
GRANT SELECT, INSERT, UPDATE ON `db-aparaty`.* TO `268513`@`localhost`;
FLUSH PRIVILEGES;