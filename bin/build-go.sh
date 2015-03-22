#!/bin/sh

# update repository & install dependencies
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y git mercurial build-essential software-properties-common wget pkg-config libgmp3-dev libreadline6-dev libpcre3-dev libpcre++-dev nodejs npm

# add ethereum repos
sudo add-apt-repository -y ppa:ethereum/ethereum-qt
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo add-apt-repository -y ppa:ethereum/ethereum-dev
sudo apt-get update -y

#install ethereum
sudo apt-get install -y ethereum

# add node symlink
sudo ln -s /usr/bin/nodejs /usr/bin/node

# install cloud-utils to fetch instance meta-data
sudo apt-get -y install cloud-utils

# add node service
cd ~/bin

[ ! -d "www" ] && git clone https://github.com/cubedro/eth-net-intelligence-api www
cd www
sudo npm install
sudo npm install pm2 -g

cp -b ./processes-go.json ./../processes.json