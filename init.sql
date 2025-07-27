-- Create users
CREATE USER 'cron'@'localhost' IDENTIFIED BY '1234';
CREATE USER 'custom'@'localhost' IDENTIFIED BY 'custom1234';
CREATE USER 'cron'@'%' IDENTIFIED BY '1234';
CREATE USER 'custom'@'%' IDENTIFIED BY 'custom1234';

-- Grant privileges
GRANT ALL PRIVILEGES ON *.* TO 'cron'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'custom'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'cron'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'custom'@'%';

-- Apply changes
FLUSH PRIVILEGES;
