sudo apt update
sudo apt install -y apache2 openssl

sudo openssl req -newkey rsa:2048 -nodes -keyout /etc/ssl/private/domain.key -x509 -days 365 -subj "/C=RU/ST=MSK/L=Moscow/O=DevOps/CN=codeby.local" -out /etc/ssl/certs/domain.crt 
sudo cp /etc/ssl/certs/domain.crt /vagrant/domain.crt

sudo a2enmod rewrite
sudo a2enmod ssl
sudo a2dissite 000-default.conf
sudo mkdir -p /opt/apache/www/codeby.local/html
sudo cp /vagrant/html/index.html /opt/apache/www/codeby.local/html/
sudo cp /vagrant/html/codeby.local.conf /etc/apache2/sites-available/
sudo a2ensite codeby.local
sudo systemctl reload apache2
