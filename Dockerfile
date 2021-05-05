FROM php:8-fpm-alpine

LABEL maintainer="Marc Anton Dahmen <https://marcdahmen.de>"

RUN apk update && \
	apk add --no-cache nginx supervisor

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && sync && \
	install-php-extensions zip curl gd

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer 

RUN composer create-project --no-scripts automad/automad /app
RUN chown -R www-data:www-data /app
RUN chmod -R 755 /app

COPY etc/php.ini /usr/local/etc/php/php.ini
COPY etc/nginx.conf /etc/nginx/nginx.conf
COPY etc/www.conf /etc/php/8.0/php-fpm.d/www.conf
COPY etc/automad.conf /etc/nginx/sites-enabled/automad.conf
COPY etc/supervisord.conf /etc/supervisord.conf

COPY init.sh /init.sh
RUN chmod +x /init.sh

WORKDIR /app
VOLUME /app

EXPOSE 80

CMD ["/init.sh"]