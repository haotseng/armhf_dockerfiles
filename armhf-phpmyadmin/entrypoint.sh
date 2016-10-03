#!/bin/bash
set -e

if [ "$1" = 'phpmyadmin' ]; then

    if [ ! -f /etc/phpmyadmin/config.secret.inc.php ] ; then
        cat > /etc/phpmyadmin/config.secret.inc.php <<EOT
<?php
\$cfg['blowfish_secret'] = '`cat /dev/urandom | tr -dc 'a-zA-Z0-9~!@#$%^&*_()+}{?></";.,[]=-' | fold -w 32 | head -n 1`';
EOT
    fi

    if [ ! -f /etc/phpmyadmin/config.user.inc.php ] ; then
        touch /etc/phpmyadmin/config.user.inc.php
    fi

    if [ ! -z $UPLOAD_SIZE ]; then
        # Modify .htaccess option
        sed -ri "s/php_value upload_max_filesize+.*/php_value upload_max_filesize $UPLOAD_SIZE/g" /usr/share/phpmyadmin/.htaccess
        sed -ri "s/php_value post_max_size+.*/php_value post_max_size $UPLOAD_SIZE/g" /usr/share/phpmyadmin/.htaccess       
    fi

    # Start Apache2
    /usr/sbin/apache2ctl -D FOREGROUND

else

    exec "$@"

fi

