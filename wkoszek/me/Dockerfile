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
	xvfb
ENV PATH /usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN \curl -sSL https://get.rvm.io | bash
ENV PATH /usr/local/rvm/rubies/ruby-2.2.4/bin:/usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN bash -l -c "rvm requirements"
RUN bash -l -c "rvm install 2.2.4"
RUN bash -l -c "gem install bundler --no-ri --no-rdoc"
ENTRYPOINT ["/entrypoint.sh"]
#VOLUME [ "/www" ]
#EXPOSE 80
