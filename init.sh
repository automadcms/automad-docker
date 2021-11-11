#!/bin/sh

if [ ! -f config/accounts.php ]; then
	php automad/console createuser
fi

/usr/bin/supervisord -c /etc/supervisord.conf