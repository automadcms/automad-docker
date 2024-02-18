#!/bin/sh

if [ ! -d /app/automad ]; then
	composer create-project --no-install --prefer-dist automad/dist /app $AUTOMAD_VERSION
	chown -R www-data:www-data /tmp/automad
	chown -R www-data:www-data /app
	chmod -R 755 /app
fi

/usr/bin/supervisord -c /etc/supervisord.conf
