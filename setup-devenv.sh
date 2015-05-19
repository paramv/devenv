#!/bin/bash

HOME_DIR=/home/param
USER_NAME=param

# Run `sudo apt-get update` and `sudo apt-get upgrade` before doing anything else!
# Make sure the ssh keys are generated and available. Also make sure the ssh configs are in place
# Add hosts, run BSO auth etc

# Need them
echo "Installing build build-essential"
sudo apt-get install build-essential

# Git
echo "Installing git"
sudo apt-get install git
sudo apt-get install git-extras

if ! [ -f /etc/samba/smb.conf ]; then
	echo "Installing samba"
    sudo apt-get install samba samba-common
fi

# Samba related
SAMBA_CONF=$HOME/devenv/smb.conf
cd /etc/samba
sudo cp smb.conf smb.conf.bk
sudo cat $SAMBA_CONF >> smb.conf
echo 'Add your user to samba by running sudo smbpasswd -a <user-name> and restart smbd'

# Mongo
echo "MongoDB setup"
echo "Installing MongoDB.."
sudo apt-get install mongodb

mkdir $HOME/data
mkdir $HOME/data/db

# Install `nvm`
echo "Installing nvm"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.1/install.sh | bash
echo "Installing node version 11"
nvm install v0.11
nvm alias default v0.11

echo "Installing node version 10"
nvm install v0.10
nvm alias ten v0.10

nvm use default


# Misc config

# Create a workspace dir
mkdir $HOME/workspace

# Own the www directory for apache
sudo chown -R $USER_NAME /var/www/

# Clone the util repo
cd $HOME/workspace
git clone ssh://siqgit/util
echo "You can run butler init now"

# Other libs - Yeoman
npm install -g yo grunt bower
