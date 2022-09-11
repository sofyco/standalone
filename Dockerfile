FROM php:8.1-cli-alpine

RUN apk add --no-cache build-base php8-dev librdkafka-dev && \
    pecl -q install mongodb rdkafka && \
    docker-php-ext-enable mongodb rdkafka && \
    rm -rf /tmp/* /var/cache/apk/*

RUN curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /app
