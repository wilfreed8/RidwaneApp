# Étape 1 : Image de base avec PHP et FPM
FROM php:8.2-fpm

# Étape 2 : Installation des extensions nécessaires
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    curl \
    git \
    libzip-dev \
    && docker-php-ext-install pdo_mysql mbstring zip exif pcntl

# Étape 3 : Installation de Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Étape 4 : Définir le dossier de travail
WORKDIR /var/www

# Étape 5 : Copier les fichiers Laravel dans le conteneur
COPY . .

# Étape 6 : Installer les dépendances PHP
RUN composer install --no-dev --optimize-autoloader

# Étape 7 : Donner les bons droits
RUN chown -R www-data:www-data /var/www \
    && chmod -R 755 /var/www/storage

EXPOSE 8000

CMD artisan serve --host=0.0.0.0 --port=8000
