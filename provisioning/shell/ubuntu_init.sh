# set localtime
sudo ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
sudo apt-get -y install rdate
sudo rdate -s time.bora.net

# update system packages
sudo apt-get purge -y vim-tiny
sudo apt-get update 
sudo apt-get install -y vim
sudo apt-get install -y openssl

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
syntax on
" > .vimrc

# set history format
export HISTTIMEFORMAT='[%F %T] '
declare -r HISTFILE

# sudo service mysql restart