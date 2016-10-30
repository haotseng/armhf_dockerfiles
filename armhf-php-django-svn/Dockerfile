FROM ebspace/armhf-apache-php-django:latest

MAINTAINER Hao Tseng "ebspace@gmail.com"

# 
# Use apt-get install packages
#
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y subversion libapache2-svn && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN /usr/sbin/a2enmod dav_svn


