FROM ebspace/armhf-apache-php:latest

MAINTAINER Hao Tseng "ebspace@gmail.com"

# 
# Use apt-get install packages
# Line 1 : Install python3 and apache wsgi for python3  
# Line 2 : Install needed librarys and tools for 'pip install mysqlclient'. See below 'pip' command
#
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y python3 python3-venv python3-setuptools libapache2-mod-wsgi-py3 && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y libmysqlclient-dev gcc python3-dev && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#
# Create Python 3 virtual environment, and install 
#
RUN /bin/bash -c "cd / && \
    pyvenv PY3VENV && \
    source /PY3VENV/bin/activate && \
    pip install Django mysqlclient && \
    rm -rf /tmp/*"

