# wkoszek/me/Dockerfile for building my personal website.
FROM wkoszek/base
MAINTAINER Wojciech A. Koszek <wojciech@koszek.com>


ENV DEBIAN_FRONTEND noninteractive
ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
RUN apt-get update && apt-get install -y \
	aspell \
	aspell-en \
	libgmp-dev \
	linkchecker \
	nginx \
	nodejs \
	pandoc \
	curl \
	make \
	xvfb \
	git \
	g++

# Crap for nokogiri
RUN apt-get update && apt-get install -y \
	build-essential \
	patch \
	ruby-dev \
	zlib1g-dev \
	liblzma-dev

RUN mkdir /nonexistent
RUN chown -Rf nobody /nonexistent
RUN mkdir -p /me
RUN chown -Rf nobody /me
WORKDIR /me
USER nobody

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN \curl -sSL https://get.rvm.io | bash -s -- --autolibs=0
ENV RUBY_VERSION 2.2.4
ENV PATH /nonexistent/.rvm/gems/ruby-${RUBY_VERSION}/bin:/nonexistent/.rvm/gems/ruby-${RUBY_VERSION}@global/bin:/nonexistent/.rvm/rubies/ruby-${RUBY_VERSION}/bin:/nonexistent/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN echo $PATH
RUN rvm version
RUN rvm install --binary 2.2.4
RUN rvm requirements
RUN gem install bundler --no-ri --no-rdoc
RUN gem install json -v '1.8.3'
COPY files/Gemfile /me/
RUN bundle install

ENTRYPOINT ["/entrypoint.sh"]
#VOLUME [ "/www" ]
#EXPOSE 80
