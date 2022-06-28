FROM php:7.2-apache

RUN apt-get update

# 1. development packages
RUN apt-get install -y \
    git \
    zip \
    curl \
    sudo \
    unzip \
    libicu-dev \
    libbz2-dev \
    libpng-dev \
    libjpeg-dev \
    libmcrypt-dev \
    libreadline-dev \
    libfreetype6-dev \
    g++ \
    libpq-dev

# 2. apache configs + document root
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# 3. mod_rewrite for URL rewrite and mod_headers for .htaccess extra headers like Access-Control-Allow-Origin-
RUN a2enmod rewrite headers

# 4. start with base php config, then add extensions
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

# RUN docker-php-ext-install \
#     bz2 \
#     intl \
#     iconv \
#     bcmath \
#     opcache \
#     calendar \
#     mbstring \
#     pdo_mysql \
#     zip

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_pgsql mbstring exif pcntl bcmath gd

# 5. composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 6. we need a user with the same UID/GID with host user
# so when we execute CLI commands, all the host file's ownership remains intact
# otherwise command from inside container will create root-owned files and directories
ARG uid
RUN useradd -G www-data,root -u 1000 -d /home/devuser devuser
RUN mkdir -p /home/devuser/.composer && \
    chown -R devuser:devuser /home/devuser

RUN composer install







# FROM nginx:alpine

# FROM php:7.4-fpm

# # Arguments defined in docker-compose.yml
# ARG sammy
# ARG 1000

# # Install system dependencies
# RUN apt-get update && apt-get install -y \
#     git \
#     curl \
#     libpng-dev \
#     libonig-dev \
#     libxml2-dev \
#     zip \
#     unzip \
#     libpq-dev

# # Clear cache
# RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# # Install PHP extensions
# RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd && docker-php-ext-install pdo pdo_pgsql

# # Get latest Composer
# COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# # Create system user to run Composer and Artisan Commands
# RUN useradd -G www-data,root -u 1000 -d /home/sammy sammy
# RUN mkdir -p /home/sammy/.composer && \
#     chown -R sammy:sammy /home/sammy

# # Set working directory
# WORKDIR /var/www

# USER sammy


# FROM php:7.2-apache

# # Arguments defined in docker-compose.yml
# ARG sammy
# ARG 1000

# RUN a2enmod rewrite

# # Install system dependencies
# RUN apt-get update && apt-get install -y \
#     git \
#     curl \
#     libpng-dev \
#     libonig-dev \
#     libxml2-dev \
#     zip \
#     unzip \
#     libpq-dev

# # Install PHP extensions
# RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd && docker-php-ext-install pdo pdo_pgsql

# # Get latest Composer
# COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# #Create system user to run Composer and Artisan Commands
# RUN useradd -G www-data,root -u 1000 -d /home/sammy sammy
# RUN mkdir -p /home/sammy/.composer && \
#     chown -R sammy:sammy /home/sammy

# # Set working directory
# WORKDIR /var/www

# USER sammy


