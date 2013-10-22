#!/bin/bash
/vagrant/provisioning/shell/ubuntu_init.sh

sudo -s

cp /vagrant/provisioning/download/jdk-7u45-linux-i586.gz /tmp/
cd /tmp
mkdir -p /usr/local/jdk
tar xvfz jdk-7u45-linux-i586.gz
chown -R root.root jdk1.7.0_45
mv jdk1.7.0_45 /usr/local/jdk/

update-alternatives --install /usr/bin/java java /usr/local/jdk/jdk1.7.0_45/bin/java 1
update-alternatives --set java /usr/local/jdk/jdk1.7.0_45/bin/java
update-alternatives --install /usr/bin/javac javac /usr/local/jdk/jdk1.7.0_45/bin/javac 1
update-alternatives --set javac /usr/local/jdk/jdk1.7.0_45/bin/javac

echo -e "JAVA_HOME=/usr/local/jdk/jdk1.7.0_45
PATH=\$PATH:\$JAVA_HOME/bin" > /etc/profile.d/jvm.sh

exit