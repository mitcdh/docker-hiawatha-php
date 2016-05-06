FROM mitcdh/alpine-hiawatha
MAINTAINER Mitchell Hewes <me@mitcdh.com>

RUN apk --update add \
    php-fpm \
    php-curl \
    php-json \
    php-xml \
    php-phar \
    php-intl \
    php-dom \
    php-openssl \
    ca-certificates && \
    rm -rf /var/cache/apk/*

# Add user and group
RUN adduser -S -G www-data -g "PHP-FPM Server" -h "/var/lib/www" php-srv

# Add configuration
ADD files/php-fpm.conf /etc/php/php-fpm.conf
ADD files/php-fpm.sh /scripts/pre-run/01_php-fpm
ADD files/hiawatha-php.conf /etc/hiawatha/conf.d/php.conf

EXPOSE 80

CMD ["/scripts/run.sh"]
