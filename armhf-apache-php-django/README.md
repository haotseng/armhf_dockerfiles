## ARMHF Apache2 with SSL, PHP5, Python3, Django support

---

Build Source :
https://github.com/haotseng/armhf_dockerfiles

---

## How to build image :

    docker build -t ebspace/armhf-apache-php-django:latest .

## Description :
    
This is a simple Apache image, including SSL support. In order to use this image effectively, you'll need to mount:

 * `/var/www/html` for your site content (e.g. using `-v /home/jdoe/mysite/:/var/www/html/`)

 * `/var/log/apache2`, optionally, if you want to store logfiles visibly outside the container

 * `/etc/ssl`, optionally, if you wish to use SSL with real keys
 
### A note on SSL

As per the defaults, Apache will use the bundled "snakeoil" key when serving SSL.
Obviously this isn't sufficient or advisable for production, so you'll want to mount your real keys onto `/etc/ssl/`.
If you name them "certs/ssl-cert-snakeoil.pem" and "private/ssl-cert-snakeoil.key", you'll be able to get by with the default config.
Otherwise, you'll want to include a revised site definition.
If you don't want to use SSL, you can avoid forwarding port 443 when launching the container (see below).

## Simple Examples

Assuming you have your content at /home/jdoe/mysite/, the below will be sufficient to serve it.
Note that many Docker users encourage mounting data from a storage container, rather than directly from the filesyetem.

"It works!", and browse to the host's IP address using http or https:


    docker run -p 80:80 -p 443:443 -d ebspace/armhf-apache-php-django:latest


Serving actual content with SSL support:

    docker run -p 80:80 -p 443:443 -v /home/jdoe/mysite/:/var/www/html/ -d ebspace/armhf-apache-php-django:latest

Without SSL support:

    docker run -p 80:80 -v /home/jdoe/mysite/:/var/www/html/ -d ebspace/armhf-apache-php-django:latest

    
Using non-standard ports:

    docker run -p 8080:80 -p 8443:443 -v /home/jdoe/mysite/:/var/www/html/ -d ebspace/armhf-apache-php-django:latest

