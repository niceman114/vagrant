#!/bin/bash
sudo -s

# set localtime
ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
apt-get -y install rdate
rdate -s time.bora.net

# update system packages
apt-get purge -y vim-tiny
apt-get update 
apt-get install -y vim
apt-get install -y openssl

# set .vimrc
echo -e "set autoindent
set backspace=eol,start,indent
set expandtab
set nobackup
set number
set shiftwidth=4
set smartindent
set softtabstop=4
set tabstop=4
set tenc=utf-8
set visualbell
colorscheme slate
filetype indent on
syntax on" > .vimrc

# set history format
export HISTTIMEFORMAT='[%F %T] '
declare -r HISTFILE

# set editor from nano to vim
update-alternatives --set editor /usr/bin/vim.basic

if [ "$1" == "jvm" ]; then
		
	cp /vagrant/provisioning/download/jdk-7u45-linux-i586.gz /tmp/
	cd /tmp
	mkdir -p /usr/local/jdk
	tar xvfz jdk-7u45-linux-i586.gz
	mv jdk1.7.0_45 /usr/local/jdk/

	update-alternatives --install /usr/bin/java java /usr/local/jdk/jdk1.7.0_45/bin/java 1
	update-alternatives --set java /usr/local/jdk/jdk1.7.0_45/bin/java
	update-alternatives --install /usr/bin/javac javac /usr/local/jdk/jdk1.7.0_45/bin/javac 1
	update-alternatives --set javac /usr/local/jdk/jdk1.7.0_45/bin/javac

	echo -e "JAVA_HOME=/usr/local/jdk/jdk1.7.0_45
	PATH=\$PATH:\$JAVA_HOME/bin" > /etc/profile.d/jvm.sh

fi

exit