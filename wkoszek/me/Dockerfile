# wkoszek/me dockerfile for github.com/wkoszek/me project
FROM ruby:2.2.4
MAINTAINER Wojciech A. Koszek <wojciech@koszek.com>

RUN mkdir -p /me
WORKDIR /me
RUN git clone https://github.com/wkoszek/me.git /me && \
	make bootstrap

#RUN cd /tmp && \
#	git clone https://github.com/wkoszek/me.git && \
#	mv me/* /me/ && \
#	cd me && \
#	bundle install

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
