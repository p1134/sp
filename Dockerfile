FROM php:8.2-apache

# Instalacja zależności systemowych
RUN apt-get update && apt-get install -y \
    git unzip libicu-dev libonig-dev libzip-dev zip \
    && docker-php-ext-install intl pdo pdo_mysql zip

# Instalacja Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Skopiuj pliki aplikacji
COPY . /var/www/html/

WORKDIR /var/www/html/

# Instalacja zależności PHP
RUN composer install --no-dev --optimize-autoloader

# Ustawienia Apache
RUN chown -R www-data:www-data /var/www/html
RUN a2enmod rewrite

EXPOSE 80
