
FROM ebspace/armhf-debian:jessie

MAINTAINER Hao Tseng "ebspace@gmail.com"

ENV BIND_DIR /bind_data
ENV BIND_INIT_CONF_DIR /bind_init_conf
ENV BIND_INIT_DATA_DIR /bind_init_data
ENV BIND_USER bind

ENV APACHE_DIR /apache_data
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2


# 
# Use apt-get install packages 
#
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y bind9 dnsutils && \
    /etc/init.d/bind9 stop && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 perl python && \
    /etc/init.d/apache2 stop && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


#
# Enable apache default site
#
RUN /usr/sbin/a2ensite default-ssl

#
# Enable Apache mods
#
RUN /usr/sbin/a2enmod ssl cgi

#
# Set entrypoint
#
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

#
# Expose ports
#
EXPOSE 53/udp 53/tcp
EXPOSE 80
EXPOSE 443


VOLUME ["${BIND_DIR}"]

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/sbin/named"]
