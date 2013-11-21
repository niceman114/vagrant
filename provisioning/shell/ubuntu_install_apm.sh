#!/bin/bash
/vagrant/provisioning/shell/ubuntu_init.sh

sudo -s

apt-get install -y apache2

# for installing mysql-server-5.5 by apt-get without password prompt
MYSQL_ROOT_PW=vagrant
export DEBIAN_FRONTEND=noninteractive
debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password '$MYSQL_ROOT_PW''
debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password '$MYSQL_ROOT_PW''

apt-get install -y mysql-server-5.5
apt-get install -y mysql-client-5.5
apt-get install -y php5
apt-get install php5-mysql

exit