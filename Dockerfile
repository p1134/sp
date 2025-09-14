# Etap 1: Budowanie aplikacji Symfony
FROM php:8.2-apache

# Instalacja zależności systemowych
RUN apt-get update && apt-get install -y \
    git unzip libicu-dev libonig-dev libzip-dev zip \
    && docker-php-ext-install intl pdo pdo_mysql zip

# Instalacja Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Skopiuj aplikację Symfony z podfolderu backend/
COPY backend/ /var/www/html/

# Ustaw katalog roboczy
WORKDIR /var/www/html/

# Instalacja zależności PHP
RUN COMPOSER_ALLOW_SUPERUSER=1 composer install --no-dev --optimize-autoloader

# Ustawienia Apache
RUN a2enmod rewrite

# Konfiguracja VirtualHost Symfony z poprawnym DocumentRoot
RUN echo "<VirtualHost *:80>" > /etc/apache2/sites-available/000-default.conf && \
    echo "    DocumentRoot /var/www/html/public" >> /etc/apache2/sites-available/000-default.conf && \
    echo "    <Directory /var/www/html/public>" >> /etc/apache2/sites-available/000-default.conf && \
    echo "        AllowOverride All" >> /etc/apache2/sites-available/000-default.conf && \
    echo "        Require all granted" >> /etc/apache2/sites-available/000-default.conf && \
    echo "    </Directory>" >> /etc/apache2/sites-available/000-default.conf && \
    echo "</VirtualHost>" >> /etc/apache2/sites-available/000-default.conf

# Ustaw właściciela plików
RUN chown -R www-data:www-data /var/www/html

# Ekspozycja portu
EXPOSE 80
