# vim:set tw=1000:
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
	apt-get -y install nvi ruby ruby-bundler ruby-dev gcc g++ make sqlite3 libsqlite3-dev postgresql postgresql-contrib libpq-dev && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Get the Gemfile.lock first, and then get all the gems to vendor/
CMD bundle install && bundle install --deployment
