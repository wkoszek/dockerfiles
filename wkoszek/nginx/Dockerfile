# Minimal nginx image.
FROM wkoszek/base
MAINTAINER Wojciech A. Koszek <wojciech@koszek.com>
RUN apt-get install -y nginx
RUN echo "Hello" > /usr/share/nginx/html/index.html
CMD [ "nginx" , "-g", "daemon off;" ]
RUN mkdir -m 0755 -p /www
VOLUME [ "/www" ]
EXPOSE 80
