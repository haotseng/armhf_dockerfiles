
FROM ebspace/armhf-apache:latest

MAINTAINER Hao Tseng "ebspace@gmail.com"


RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y php5 php5-mysql libapache2-mod-php5 && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN /usr/sbin/a2dismod 'mpm_*' && /usr/sbin/a2enmod mpm_prefork rewrite

EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
