FROM emonty/ubuntu
MAINTAINER Monty Taylor <mordred@inaugust.com>
COPY build.sh /build.sh
RUN bash /build.sh
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 6667
CMD ["/usr/bin/supervisord"]
