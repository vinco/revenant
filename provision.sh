#!/bin/bash

function update {
    echo -e "\n \e[92m Update machine"
    sudo apt-get -y update
}

function upgrade {
    echo -e "\n \e[92m Upgrade machine"
    sudo apt-get -y upgrade
}

# ---- Add repositories -----

function add-reposirories {
    echo -e "\n \e[92m Add repositories"
    sudo add-apt-repository ppa:ubuntu-mozilla-daily/ppa -yqq
}


# ------ Languages ------

# Install python rqueriments: python, pip and virtualenv
function install-python {
    echo -e "\n \e[92m Install python, pip and virtualenv"
    sudo apt-get install -yqq python-pip python-dev build-essential 
    sudo pip install --upgrade pip
    sudo pip install --upgrade virtualenv
    sudo pip install vo-fabutils
}

# Install php5
function install-php5 {
    echo -e "\n \e[92m Install php5"
    sudo apt-get install -yqq qphp5 libapache2-mod-php5 php5-mcrypt
}

function install-nvm {
    echo -e "\n \e[92m Install Node version manager"
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash
    echo "source /home/$USER/.nvm/nvm.sh" >> /home/$USER/.profile
    source /home/$USER/.profile
}

# ----- Web Servers ------

# Install apache2
function install-apache2 {
    echo -e "\n \e[92m Install apache2"
    sudo apt-get install apache2 -yqq
}

# Install nginx
function install-nginx {
    echo -e "\n \e[92m Install nginx"
    sudo apt-get install -yqq nginx
}


# ------Web Browsers -----

# Install opera
# Warning: The opera download url could change
function install-opera {
    echo -e "\n \e[92m Install Opera"
    cd /usr/local/src
    sudo wget -O opera.deb "http://www.opera.com/download/get/?id=39079&location=410&nothanks=yes&sub=marine"
    sudo dpkg -i opera.deb
    cd ~
}

function install-nightly {
    echo -e "\n \e[92m Install Nightly"
     sudo apt-get install firefox-trunk -yqq
}

# ----- Utilities ------

function install-utilities {
    echo -e "\n \e[92m Install utilities"
    echo -e "\n \e[104m Install git"
    sudo apt-get install -yqq git
    echo -e "\n \e[104m Install git-core"
    sudo apt-get install -yqq git-core
    echo -e "\n \e[104m Install git-cola"
    sudo apt-get install -yqq git-cola
    echo -e "\n \e[104m Install curl"
    sudo apt-get install -yqq curl
    echo -e "\n \e[104m Install filezilla"
    sudo apt-get install -yqq filezilla
    echo -e "\n \e[104m Install gimp"
    sudo apt-get install -yqq gimp
    echo -e "\n \e[104m Install inkscape"
    sudo apt-get install -yqq inkscape
    echo -e "\n \e[104m Install nfsd"
    sudo apt-get install -yqq rpcbind nfs-common nfs-kernel-server
}

function install-vagrant {
    echo -e "\n \e[92m Install vagrant"
    cd /usr/local/src
    sudo wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2_x86_64.deb
    sudo dpkg -i vagrant_1.7.2_x86_64.deb
    vagrant plugin install vagrant-hostsupdater
    cd ~
}

function install-zsh {
    echo -e "\n \e[92m Install zsh"
    sudo apt-get install zsh -y
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
}

function install-virtualbox {
    echo -e "\n \e[92m Install virtualbox"
    cd /usr/local/src
    sudo wget http://download.virtualbox.org/virtualbox/4.3.28/virtualbox-4.3_4.3.28-100309~Ubuntu~precise_amd64.deb
    sudo dpkg -i virtualbox-4.3_4.3.28-100309~Ubuntu~precise_amd64.deb
    cd ~
}

function install-docker {
    echo -e "\n \e[92m Install docker"
    curl -sSL https://get.docker.com/ | sh
}

function install-composer {
    echo -e "\n \e[92m Install docker"
    cd ~
    curl -sS https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer
}


echo -e "\e[104mInit the instalation for new machine"
