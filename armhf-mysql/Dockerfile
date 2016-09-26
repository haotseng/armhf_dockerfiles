
FROM ebspace/armhf-debian:latest

MAINTAINER Hao Tseng "ebspace@gmail.com"

# Install MySQL
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends mysql-server mysql-client  && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    /etc/init.d/mysql stop && \
    rm -rf /var/lib/mysql/*

#
# The init-db scripts or sql command files in this directory will be executed when container created.
# The details please refer "entrypoint.sh"
#
RUN mkdir /docker-entrypoint-initdb.d

VOLUME /var/log/mysql
VOLUME /var/lib/mysql

EXPOSE 3306


COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["mysqld"]


