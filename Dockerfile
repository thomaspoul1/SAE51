# Use an official Nginx image
FROM nginx

# Install required packages
# Nouvelles lignes (adaptées à la version disponible dans les dépôts)
RUN apt-get update && apt-get install -y \
    apt-transport-https lsb-release ca-certificates curl vim \
    php-fpm php-mbstring php-gd php-curl php-xml php-intl php-imap php-zip php-mysql \
    mariadb-server wget

# Add PHP repository
RUN curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg
RUN sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
RUN apt-get update && apt-get upgrade -y

# Set up Nginx configuration
COPY nginx-default /etc/nginx/sites-enabled/default

# Download and extract Dolibarr
RUN mkdir -p /var/www/html
WORKDIR /var/www/html
RUN wget https://sourceforge.net/projects/dolibarr/files/Dolibarr%20ERP-CRM/18.0.4/dolibarr-18.0.4.tgz
RUN tar xvfz dolibarr-18.0.4.tgz
RUN mv dolibarr-18.0.4/htdocs dolibarr

# Set permissions
RUN chown www-data:www-data dolibarr/conf/

# Expose ports
EXPOSE 80

# Restart Nginx
CMD ["nginx", "-g", "daemon off;"]

