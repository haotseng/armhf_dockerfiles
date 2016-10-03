## ARMHF phpMyAdmin

phpMyAdmin docker image for ARM armhf architecture

---

Build Source :
https://github.com/haotseng/armhf_dockerfiles

---

## How to build image :

    docker build -t ebspace/armhf-phpmyadmin:latest .


## Usage with linked MySQL server

First you need to run MySQL or MariaDB server in Docker, and this image need
link a running mysql instance container:

```
docker run --name myadmin -d --link mysql_db_server:db -p 8080:80 ebspace/armhf-phpmyadmin
```

## Usage with external MySQL server

You can specify MySQL host in the `PMA_HOST` environment variable. You can also
use `PMA_PORT` to specify port of the server in case it's not the default one:

```
docker run --name myadmin -d -e PMA_HOST=dbhost -p 8080:80 ebspace/armhf-phpmyadmin
```

## Usage with arbitrary MySQL server

You can use arbitrary servers by adding ENV variable `PMA_ARBITRARY=1` to the startup command:

```
docker run --name myadmin -d --link mysql_db_server:db -p 8080:80 -e PMA_ARBITRARY=1 ebspace/armhf-phpmyadmin
```


## Adding Custom Configuration

You can add your own custom config.inc.php settings (such as Configuration Storage setup) 
by creating a file named "config.user.inc.php" with the various user defined settings
in it, and then linking it into the container using:

``` 
docker run --name myadmin -d --link mysql_db_server:db -p 8080:80 -v /local_dir/config.user.inc.php:/etc/phpmyadmin/config.user.inc.php ebspace/armhf-phpmyadmin
```

## Environment variables for PHPMyAdmin

* ``PMA_ARBITRARY`` - when set to 1 connection to the arbitrary server will be allowed
* ``PMA_HOST`` - define address/host name of the MySQL server
* ``PMA_VERBOSE`` - define verbose name of the MySQL server
* ``PMA_PORT`` - define port of the MySQL server
* ``PMA_HOSTS`` - define comma separated list of address/host names of the MySQL servers
* ``PMA_VERBOSES`` - define comma separated list of verbose names of the MySQL servers
* ``PMA_USER`` and ``PMA_PASSWORD`` - define username to use for config authentication method
* ``PMA_ABSOLUTE_URI`` - define user-facing URI



## Specify allowed upload file size

Sometimes it is necessary to upload big dump which doesn't fit into default limit 128M. You can specify alternative size via environment variable ``UPLOAD_SIZE``

```
docker run --rm --link mysql_db_server:db -p 8080:80 -e UPLOAD_SIZE=1G ebspace/armhf-phpmyadmin
```


## Test the phpMyAdmin

All examples will bring you phpMyAdmin on `http://your_host_ip:8080/phpmyadmin`



