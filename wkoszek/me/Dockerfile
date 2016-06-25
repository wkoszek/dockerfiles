# wkoszek/me dockerfile for github.com/wkoszek/me project
FROM ruby:2.3.1
MAINTAINER Wojciech A. Koszek <wojciech@koszek.com>

RUN mkdir -p /me
WORKDIR /me
COPY files/Gemfile /me/
RUN bundle install

RUN apt-get update -qq && apt-get install -y \
	aspell \
	aspell-en \
	nodejs \
	nginx \
	linkchecker \
	curl \
	libfontconfig \
	nvi

#--------------------------------------------------------------------------
COPY files/aspell_setup.sh /me
RUN /me/aspell_setup.sh

#--------------------------------------------------------------------------
# PhantomJS
ENV PHANTOMJS_VER "phantomjs-2.1.1-linux-x86_64"
ENV PHANTOMJS_URL https://bitbucket.org/ariya/phantomjs/downloads/${PHANTOMJS_VER}.tar.bz2
RUN cd /tmp && \
	curl -A "Mozilla" -s -L -o - ${PHANTOMJS_URL} | tar xjf - && \
	mv ${PHANTOMJS_VER}/bin/phantomjs /usr/local/bin && \
	rm -rf ${PHANTOMJS_NAME} phantomjs.tar.bz2
#--------------------------------------------------------------------------

ENV TEST_CI "yes"

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
