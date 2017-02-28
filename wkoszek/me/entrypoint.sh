#!/bin/sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

set -e

echo "# entrypoint"
pwd
ls -la

#export NO_HEADLESS=yes
export DISPLAY=":99.0"
#sh -e /etc/init.d/xvfb start

echo "# git stuff"
git config --global user.email "wojciech@koszek.com"
git config --global user.name "Wojciech Adam Koszek"

echo "# start ssh-agent"
eval `ssh-agent`
chmod 600 /me/etc/deploy
ssh-add /me/etc/deploy
mkdir  -p ~/.ssh
ssh-keyscan -H github.com >> ~/.ssh/known_hosts
cp /me/etc/ssh_config ~/.ssh/config

make doit pub | ts
echo $?
echo "# finished"
