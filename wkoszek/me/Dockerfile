# wkoszek/me dockerfile for github.com/wkoszek/me project
FROM ruby:2.2.4
MAINTAINER Wojciech Adam Koszek <wojciech@koszek.com>

RUN mkdir -p /me
WORKDIR /me

ADD https://raw.githubusercontent.com/wkoszek/me/master/makefile /me/makefile
ADD https://raw.githubusercontent.com/wkoszek/me/master/Gemfile /me/Gemfile

RUN make bootstrap && rm -rf makefile Gemfile

RUN apt-get update -qq && apt-get install -y \
	aspell \
	aspell-en \
	moreutils \
	nodejs \
	nginx \
	linkchecker \
	curl \
	libfontconfig \
	nvi \
	&& \
    rm -rf \
	/var/lib/apt/lists/* \
	/var/lib/dpkg \
	/var/lib/cache \
	/var/lib/log

#--------------------------------------------------------------------------
# PhantomJS
ENV PHANTOMJS_VER "phantomjs-2.1.1-linux-x86_64"
ENV PHANTOMJS_URL https://github.com/wkoszek/files/raw/master/${PHANTOMJS_VER}.tar.bz2
RUN cd /tmp && \
	curl -A "Mozilla" -s -L -o - ${PHANTOMJS_URL} | tar xjf - && \
	mv ${PHANTOMJS_VER}/bin/phantomjs /usr/local/bin && \
	rm -rf ${PHANTOMJS_NAME} phantomjs.tar.bz2
#--------------------------------------------------------------------------

ENV TEST_CI "yes"

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
