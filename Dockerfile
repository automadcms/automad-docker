FROM php:8.3-fpm-alpine

LABEL maintainer="Marc Anton Dahmen <https://marcdahmen.de>"

ARG version
ENV AUTOMAD_VERSION=$version

RUN apk update && \
	apk add --no-cache nginx supervisor

RUN mkdir /var/lib/nginx/tmp/client_body
RUN chown -R www-data:www-data /var/lib/nginx
RUN chmod -R 755 /var/lib/nginx

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && sync && \
	install-php-extensions zip curl gd

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

COPY etc/php.ini /usr/local/etc/php/
COPY etc/www.conf /usr/local/etc/php-fpm.d/
COPY etc/nginx.conf /etc/nginx/
COPY etc/automad.conf /etc/nginx/sites-enabled/
COPY etc/supervisord.conf /etc/

COPY init.sh /init.sh
RUN chmod +x /init.sh

WORKDIR /app
VOLUME /app

EXPOSE 80

CMD ["/init.sh"]
