#!/bin/sh

if [ ! -f config/accounts.php ]; then
	composer create-project --no-install automad/automad /app
	chown -R www-data:www-data /app
	chmod -R 755 /app
fi

/usr/bin/supervisord -c /etc/supervisord.conf
