#!/bin/sh

set -e

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

echo "# entrypoint"
pwd
ls -la
make bootstrap | ts
make doit pub | ts
echo $?
echo "# finished"


#sleep 3 # give xvfb some time to start
#openssl aes-256-cbc -K $encrypted_d99751a86d14_key -iv $encrypted_d99751a86d14_iv -in etc/deploy.enc -out $HOME/deploy -d
