#!/bin/sh

if [ ! -f config/accounts.php ]; then
	php automad/console createuser
	chown www-data:www-data config/accounts.php
fi

/usr/bin/supervisord -c /etc/supervisord.conf