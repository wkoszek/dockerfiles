# My Dockerfile repository

[![Build Status](https://travis-ci.org/wkoszek/dockerfiles.svg?branch=master)](https://travis-ci.org/wkoszek/dockerfiles)

This repo holds many `Dockerfile` files which are a source of my Docker
images.

# How it works

The `build.sh` is here to build the images and push them to the
Docker registry. Also wired is a Travis CI service. Travis uses `build.sh`
on the remote machine, so that essentially the whole flow after pushing your
commits is automated.

For now the script is getting all images from `wkoszek/*` hierarchy pushed.
You will have to change that to your own Docker username.

# Travis CI

In order for you to reproduce the environment on Travis you should setup
its environment variables by executing this script:

https://raw.githubusercontent.com/wkoszek/docker_edu/master/travis_setup.sh

