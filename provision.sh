#!/bin/bash

REVENANT_HOME=/home/$USER/.revenant

function update {
    echo -e "\n \e[92m Update machine\e[0m"
    sudo apt-get -y update
}

function upgrade {
    echo -e "\n \e[92m Upgrade machine\e[0m"
    sudo apt-get -y upgrade
}

# ---- Add repositories -----

function add-repositories {
    echo -e "\n \e[92m Add repositories\e[0m"
    sudo add-apt-repository ppa:ubuntu-mozilla-daily/ppa -y
    sudo add-apt-repository ppa:webupd8team/sublime-text-2 -y
    sudo apt-add-repository ppa:rael-gc/rvm -y
}

function setup {
    echo -e "\n \e[104m Please give me your name for git and press [ENTER]\e[0m"
    read GITNAME
    echo -e "\n \e[104m Please give me your mail for git user and press [ENTER]\e[0m"
    read GITMAIL
    echo -e "\n \e[92m Create the revenant folder and PHPAaS folders\e[0m"
    mkdir -p /home/$USER/.revenant
    mkdir -p /home/$USER/vincoorbis
    echo -e "\n \e[92m Set environment variables\e[0m"
    echo "REVENANT_HOME=/home/$USER/.revenant" >> ~/.profile
    echo "GITNAME=$GITNAME" >> ~/.profile
    echo "GITMAIL=$GITMAIL" >> ~/.profile
    source ~/.profile
}


# ------ Languages ------

# Install python rqueriments: python, pip and virtualenv
function install-python {
    echo -e "\n \e[92m Install python, pip and virtualenv\e[0m"
    sudo apt-get install -yqq python-pip python-dev build-essential 
    sudo pip install --upgrade pip
    sudo pip install --upgrade fabric
    sudo pip install --upgrade virtualenv
    sudo pip install vo-fabutils
}

# Install php5
function install-php5 {
    echo -e "\n \e[92m Install php5\e[0m"
    sudo apt-get install -yqq php5 libapache2-mod-php5 php5-mcrypt
}

function install-nvm {
    echo -e "\n \e[92m Install Node version manager\e[0m"
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash
    echo "source /home/$USER/.nvm/nvm.sh" >> /home/$USER/.profile
    source ~/.profile
    nvm install 0.12
    nvm use 0.12
}

function install-rvm {
    echo -e "\n \e[92m Install Ruby version manager\e[0m"
    sudo apt-get install -yqq rvm
}

# ----- Web Servers ------

# Install apache2
function install-apache2 {
    echo -e "\n \e[92m Install apache2\e[0m"
    sudo apt-get install apache2 -yqq
    echo manual | sudo tee /etc/init/apache2.override
    sudo service apache2 stop
}

# Install nginx
function install-nginx {
    echo -e "\n \e[92m Install nginx\e[0m"
    sudo apt-get install -yqq nginx
}


# ------Web Browsers -----

# Install opera
# Warning: The opera download url could change
function install-opera {
    echo -e "\n \e[92m Install Opera\e[0m"
    cd /usr/local/src
    sudo wget -O opera.deb "http://www.opera.com/download/get/?id=39079&location=410&nothanks=yes&sub=marine"
    sudo dpkg -i opera.deb
    cd ~
}

function install-nightly {
    echo -e "\n \e[92m Install Nightly\e[0m"
     sudo apt-get install firefox-trunk -yqq
}

# ----- Utilities ------

function install-utilities {
    echo -e "\n \e[92m Install utilities\e[0m"
    echo -e "\n \e[104m Install git\e[0m"
    sudo apt-get install -yqq git
    echo -e "\n \e[104m Install git-core\e[0m"
    sudo apt-get install -yqq git-core
    echo -e "\n \e[104m Install git-cola\e[0m"
    sudo apt-get install -yqq git-cola
    echo -e "\n \e[104m Install curl\e[0m"
    sudo apt-get install -yqq curl
    echo -e "\n \e[104m Install filezilla\e[0m"
    sudo apt-get install -yqq filezilla
    echo -e "\n \e[104m Install gimp\e[0m"
    sudo apt-get install -yqq gimp
    echo -e "\n \e[104m Install inkscape\e[0m"
    sudo apt-get install -yqq inkscape
    echo -e "\n \e[104m Install nfsd\e[0m"
    sudo apt-get install -yqq rpcbind nfs-common nfs-kernel-server
    echo -e "\n \e[104m Install gftp\e[0m"
    sudo apt-get install -yqq gftp
}

function install-vagrant {
    echo -e "\n \e[92m Install vagrant\e[0m"
    cd /usr/local/src
    sudo wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb
    sudo dpkg -i vagrant_1.7.2_x86_64.deb
    vagrant plugin install vagrant-hostsupdater
    cd ~
}

function install-zsh {
    echo -e "\n \e[92m Install zsh\e[0m"
    sudo apt-get install zsh -y
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
}

function install-virtualbox {
    echo -e "\n \e[92m Install virtualbox\e[0m"
    cd /usr/local/src
    sudo wget http://download.virtualbox.org/virtualbox/4.3.28/virtualbox-4.3_4.3.28-100309~Ubuntu~precise_amd64.deb
    sudo dpkg -i virtualbox-4.3_4.3.28-100309~Ubuntu~precise_amd64.deb
    cd ~
}

function install-docker {
    echo -e "\n \e[92m Install docker\e[0m"
    curl -sSL https://get.docker.com/ | sh
}

function install-composer {
    echo -e "\n \e[92m Install docker\e[0m"
    cd ~
    curl -sS https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer
}

function install-tmux {
    echo -e "\n \e[92m Install tmux\e[0m"
    sudo apt-get install -yqq tmux
}

function install-terminator {
    echo -e "\n \e[92m Install terminator\e[0m"
    sudo apt-get install -yqq terminator
}

# ---- Editors ------

function install-sublime2 {
    echo -e "\n \e[92m Install Sublime Text 2\e[0m"
    sudo apt-get install sublime-text
}

function install-vim {
    echo -e "\n \e[92m Install Vim Awesome Daniel\e[0m"
    sudo apt-get remove -yqq vim.tiny
    sudo apt-get install -yqq vim vim-gnome
    git clone --recursive https://github.com/dgamboaestrada/vim-awesome.git $REVENANT_HOME/vim-awesome
    cd $REVENANT_HOME/vim-awesome
    ./install.sh
}

function install-dot-files {
    echo -e "\n \e[92m Install dotfiles\e[0m"
    git clone https://github.com/rodrisan/dotfiles.git $REVENANT_HOME/dotfiles

    file=~/.gitconfig
    if [ -f $file ] ; then
        rm -r .gitconfig
    fi

    ln -s $REVENANT_HOME/dotfiles/.gitconfig $HOME
    sed -i "s, email *= *.* ,email = $GITMAIL,g" $HOME/.gitconfig
    sed -i "s, name *= *.* ,name = $GITMAIL,g" $HOME/.gitconfig
}

function bootstrap {
    echo -e "\e[105mHi, Revenant init ...\e[0m" 
    setup
    add-repositories
    update
    upgrade
    install-utilities
    install-terminator
    install-virtualbox
    install-vagrant
    install-docker
    install-composer
    install-zsh
    install-tmux
    install-python
    install-php5
    install-nvm
    install-rvm
    install-sublime2
    install-vim
    install-apache2
    install-nginx

}
bootstrap


# call arguments verbatim:
$@

