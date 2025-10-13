#!/bin/bash

# Update package index and install essential packages
sudo apt update
sudo apt install -y curl wget apt-transport-https ca-certificates software-properties-common


# Install Apache
sudo apt install -y apache2
echo "Apache installed successfully."


# Install Node.js and npm
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt update && sudo apt install nodejs -y
echo "Node.js and npm installed successfully."


# Install Yarn
sudo npm install -g yarn
echo "Yarn installed successfully."


# Install PHP and Composer
sudo apt install -y php php-cli php-mysql php-mbstring unzip
sudo php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
sudo php -r "unlink('composer-setup.php');"
echo "PHP and Composer installed successfully."


# Install MySQL
sudo apt install -y mysql-server
echo "MySQL installed successfully."


# Install PM2 for Node.js process management
sudo npm install -g pm2
echo "PM2 installed successfully."


# Install Certbot and Apache plugin
sudo apt install -y certbot python3-certbot-apache
sudo ufw allow 'Apache Full'
sudo ufw delete allow 'Apache'
echo "Certbot and Apache plugin installed successfully."

# Enable the core Apache proxy module & HTTP-specific proxying support
sudo a2enmod proxy
sudo a2enmod proxy_http

# Start Apache and enable on boot
sudo systemctl start apache2
sudo systemctl enable apache2
echo "Apache started and enabled."


# Print completion message
echo "Server setup complete!"
