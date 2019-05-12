# This Dockerfile is just for building stuff. It'll install
# all the tools and run bundler. Bundler will make a cache in
# vendor/ directory. 
#
#
FROM ubuntu:19.04

MAINTAINER Wojciech Adam Koszek "wojciech@koszek.com"

WORKDIR /src

RUN \
	apt-get update && \
	apt-get -y install ruby ruby-bundler ruby-dev gcc g++ make && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD bundle install --deployment
