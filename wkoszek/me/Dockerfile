### wkoszek/me/Dockerfile for building my personal website.
FROM ruby:2.3.1
MAINTAINER Wojciech A. Koszek <wojciech@koszek.com>

RUN mkdir -p /me
WORKDIR /me
COPY files/Gemfile /me/
RUN bundle install

RUN apt-get update && apt-get install -y \
	aspell \
	aspell-en \
	nodejs

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

### wkoszek/me/Dockerfile for building my personal website.
##FROM ubuntu:14.04
##MAINTAINER Wojciech A. Koszek <wojciech@koszek.com>
##
##ENV DEBIAN_FRONTEND noninteractive
##ADD entrypoint.sh /entrypoint.sh
##RUN chmod a+x /entrypoint.sh
##RUN apt-get update && apt-get install -y \
##	aspell \
##	aspell-en \
##	libgmp-dev \
##	linkchecker \
##	nginx \
##	nodejs \
##	pandoc \
##	curl \
##	make \
##	xvfb \
##	git \
##	g++
##
### Crap for nokogiri
##RUN apt-get update && apt-get install -y \
##	build-essential \
##	patch \
##	ruby-dev \
##	zlib1g-dev \
##	liblzma-dev
##
### Requirements for phantom-js
##RUN apt-get update && apt-get install -y \
##	chrpath \
##	libssl-dev \
##	libxft-dev \
##	libfreetype6 \
##	libfreetype6-dev \
##	libfontconfig1 \
##	libfontconfig1-dev
##
##RUN apt-get update && apt-get install -y \
##	vim
##
##RUN mkdir /nonexistent
##RUN chown -Rf nobody /nonexistent
##RUN mkdir -p /me
##RUN chown -Rf nobody /me
##
###ENV PHANTOM_JS phantomjs-2.1.1-linux-x86_64
###WORKDIR /nonexistent
###RUN curl -o /nonexistent/$PHANTOM_JS.tar.bz2 "https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2"
###RUN ls -la
###RUN tar xvjf $PHANTOM_JS.tar.bz2
###RUN ls -la
###RUN mv $PHANTOM_JS /usr/local/share
###RUN ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin
##
##WORKDIR /me
##USER nobody
##
##RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
##RUN \curl -sSL https://get.rvm.io | bash -s -- --autolibs=0
##ENV RUBY_VERSION 2.2.4
##ENV PATH /nonexistent/.rvm/gems/ruby-${RUBY_VERSION}/bin:/nonexistent/.rvm/gems/ruby-${RUBY_VERSION}@global/bin:/nonexistent/.rvm/rubies/ruby-${RUBY_VERSION}/bin:/nonexistent/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
##RUN echo $PATH
###RUN phantomjs --version
##RUN rvm version
###RUN rvm list
##RUN rvm install --binary ${RUBY_VERSION}
##RUN rvm requirements
##RUN gem install bundler --no-ri --no-rdoc
##RUN gem install json -v '1.8.3'
##COPY files/Gemfile /me/
##RUN bundle install
##
##ENTRYPOINT ["/entrypoint.sh"]
###VOLUME [ "/www" ]
###EXPOSE 80
