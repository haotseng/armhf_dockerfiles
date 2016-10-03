
FROM ebspace/armhf-debian:latest

MAINTAINER Hao Tseng "ebspace@gmail.com"


RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

RUN /usr/sbin/a2ensite default-ssl
RUN /usr/sbin/a2enmod ssl

EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
