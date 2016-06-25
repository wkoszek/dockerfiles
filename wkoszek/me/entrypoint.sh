#!/bin/sh

set -e

#export NO_HEADLESS=yes
export DISPLAY=":99.0"
#sh -e /etc/init.d/xvfb start

echo "# entrypoint"
pwd
ls -la
make doit pub
echo $?
echo "# finished"


#sleep 3 # give xvfb some time to start
#openssl aes-256-cbc -K $encrypted_d99751a86d14_key -iv $encrypted_d99751a86d14_iv -in etc/deploy.enc -out $HOME/deploy -d
#- chmod 600 $HOME/deploy
#
#git config --global user.email "wojciech@koszek.com"
#git config --global user.name "Wojciech A. Koszek"
#git remote add github git@github.com:wkoszek/me.git
#cp etc/ssh_config ~/.ssh/config

