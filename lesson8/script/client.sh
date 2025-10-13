sudo echo "192.168.21.103 codeby.local www.codeby.local" >> /etc/hosts
sudo cp /vagrant/domain.crt /usr/local/share/ca-certificates/
sudo update-ca-certificates