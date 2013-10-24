#!/bin/bash
sudo -s

# set localtime
ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
apt-get -y install rdate
rdate -s time.bora.net

# update system packages
apt-get purge -y vim-tiny
apt-get update 
apt-get install -y git
apt-get install -y openssl
apt-get install -y vim

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

exit