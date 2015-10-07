#!/bin/sh

if [ ! -f labs-deploy ]; then
	ssh-keygen -b 4096 -t ed25519 -f labs-deploy
fi
