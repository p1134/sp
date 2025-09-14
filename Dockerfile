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

# 🔧 Konfiguracja VirtualHost Symfony
RUN echo "<VirtualHost *:80>" > /etc/apache2/sites-available/000-default.conf && \
    echo "    DocumentRoot /var/www/html/public" >> /etc/apache2/sites-available/000-default.conf && \
    echo "    <Directory /var/www/html/public>" >> /etc/apache2/sites-available/000-default.conf && \
    echo "        AllowOverride All" >> /etc/apache2/sites-available/000-default.conf && \
    echo "        Require all granted" >> /etc/apache2/sites-available/000-default.conf && \
    echo "    </Directory>" >> /etc/apache2/sites-available/000-default.conf && \
    echo "</VirtualHost>" >> /etc/apache2/sites-available/000-default.conf

# 🔧 Dodaj .htaccess do public/, jeśli go nie masz
RUN echo "RewriteEngine On\nRewriteCond %{REQUEST_FILENAME} !-f\nRewriteRule ^(.*)$ index.php [QSA,L]" > /var/www/html/public/.htaccess

# 🔐 Ustaw uprawnienia do Secret File z Firebase
RUN chmod 644 /etc/secrets/firebase_credentials.json || true

# Ustaw właściciela plików
RUN chown -R www-data:www-data /var/www/html

# Ekspozycja portu
EXPOSE 80
