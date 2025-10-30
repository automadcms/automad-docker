#!/bin/sh

set -e

setPermissions() {
	mkdir -p /tmp/automad
	chown -R www-data:www-data /tmp/automad
	chown -R www-data:www-data /app
	chmod -R 755 /app
}

if [ ! -d /app/automad ]; then
	composer create-project --no-install --prefer-dist automad/automad /app $AUTOMAD_VERSION
	setPermissions
	echo
fi

if [ -n "$UID" ]; then
	CURRENT_UID=$(id -u www-data 2>/dev/null || echo "")

	if [ "$UID" != "$CURRENT_UID" ]; then
		echo "Updating www-data UID to $UID ..."
		usermod -u "$UID" www-data
		setPermissions
	fi
fi

/usr/bin/supervisord -c /etc/supervisord.conf
