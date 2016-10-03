
FROM ebspace/armhf-apache-php:latest

MAINTAINER Hao Tseng "ebspace@gmail.com"


RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y phpmyadmin && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD phpmyadmin.conf /etc/apache2/conf-enabled/phpmyadmin.conf
ADD config.inc.php /etc/phpmyadmin/config.inc.php
ADD .htaccess /usr/share/phpmyadmin


COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["phpmyadmin"]
