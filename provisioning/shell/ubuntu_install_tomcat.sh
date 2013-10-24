#!/bin/bash
/vagrant/provisioning/shell/ubuntu_install_jdk.sh

sudo -s

cd /tmp

mkdir -p /usr/local/tomcat
wget http://apache.mirror.cdnetworks.com/tomcat/tomcat-7/v7.0.42/bin/apache-tomcat-7.0.42.tar.gz
tar xvzf apache-tomcat-7.0.42.tar.gz
mv apache-tomcat-7.0.42 /usr/local/tomcat
rm -f apache-tomcat-7.0.42.tar.gz

update-alternatives --install /usr/bin/tomcat-start tomcat-start /usr/local/tomcat/apache-tomcat-7.0.42/bin/startup.sh 1
update-alternatives --set tomcat-start /usr/local/tomcat/apache-tomcat-7.0.42/bin/startup.sh
update-alternatives --install /usr/bin/tomcat-stop tomcat-stop /usr/local/tomcat/apache-tomcat-7.0.42/bin/shutdown.sh 1
update-alternatives --set tomcat-stop /usr/local/tomcat/apache-tomcat-7.0.42/bin/shutdown.sh

echo "export CATALINA_HOME=/usr/local/tomcat/apache-tomcat-7.0.42" >> /etc/profile

tomcat-start

exit	