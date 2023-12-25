FROM composer:latest

WORKDIR /var/www/html

# prefix 'composer' and set flag to ignore errors
ENTRYPOINT [ "composer", "--ignore-platform-reqs"]
