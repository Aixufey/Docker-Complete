FROM nginx:stable-alpine

WORKDIR /etc/nginx/conf.d

# After running Composer installing Laravel PHP, copy and merge the config into Container.
# Copy the config file from HOST into /etc/nginx/conf.d/default.conf in nginx container.
COPY nginx/nginx.conf .

# copy and rename to default.conf
RUN mv nginx.conf default.conf

WORKDIR /var/www/html

COPY src .
