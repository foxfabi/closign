FROM php:8.3-fpm-alpine

# System-Abhängigkeiten für PHP-Erweiterungen und Xdebug
RUN apk add --no-cache \
  $PHPIZE_DEPS \
  linux-headers \
  libpng-dev \
  libjpeg-turbo-dev \
  freetype-dev \
  libzip-dev \
  icu-dev \
  unzip \
  git \
  bash \
  curl

# Drupal-Standard-Erweiterungen installieren
RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \
  docker-php-ext-install -j$(nproc) \
  gd \
  pdo_mysql \
  pdo_sqlite \
  zip \
  opcache \
  intl\
  bcmath \
  sockets

# Redis und Xdebug via PECL installieren
RUN pecl install redis xdebug && \
  docker-php-ext-enable redis xdebug

# Xdebug-Konfigurationsdatei
RUN echo $'[xdebug]\n\
  zend_extension=xdebug\n\
  xdebug.mode=debug\n\
  xdebug.start_with_request=yes\n\
  xdebug.client_host=host.docker.internal\n\
  xdebug.client_port=9003\n\
  xdebug.idekey=VSCODE\n\
  xdebug.log_level=0\
  ' > /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# ... nach den anderen Installationen, vor dem Aufräumen (apk del)
RUN curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar \
  && cp phpcs.phar /usr/local/bin/phpcs \
  && chmod +x /usr/local/bin/phpcs \
  && curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar \
  && cp phpcbf.phar /usr/local/bin/phpcbf \
  && chmod +x /usr/local/bin/phpcbf

# Assertions modern deaktivieren UND die veraltete INI-Direktive ruhigstellen
RUN echo "zend.assertions=-1" > /usr/local/etc/php/conf.d/assertions.ini

# Aufräumen, um das Image schlank zu halten
RUN apk del $PHPIZE_DEPS