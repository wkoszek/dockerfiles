# Minimal nginx image.
FROM wkoszek/base
MAINTAINER Wojciech A. Koszek <wojciech@koszek.com>
ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
#VOLUME [ "/www" ]
#EXPOSE 80
