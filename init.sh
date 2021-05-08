#!/bin/sh

if [ ! -f config/accounts.php ]; then
	php automad/console update
	php automad/console createuser
	rm -rf cache/update
fi

/usr/bin/supervisord -c /etc/supervisord.conf