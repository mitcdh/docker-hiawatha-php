FROM mitcdh/alpine-hiawatha
MAINTAINER Mitchell Hewes <me@mitcdh.com>

RUN apk --update add \
    php5-fpm \
    php5-curl \
    php5-json \
    php5-xml \
    php5-phar \
    php5-intl \
    php5-dom \
    php5-openssl \
    ca-certificates && \
    rm -rf /var/cache/apk/*

# Add user and group
RUN adduser -S -G www-data -g "PHP-FPM Server" -h "/var/lib/www" php-srv

# Add configuration
ADD files/php-fpm.conf /etc/php5/php-fpm.conf
ADD files/php-fpm.sh /scripts/pre-run/01_php-fpm
ADD files/hiawatha-php.conf /etc/hiawatha/conf.d/php.conf

EXPOSE 80

CMD ["/scripts/run.sh"]
