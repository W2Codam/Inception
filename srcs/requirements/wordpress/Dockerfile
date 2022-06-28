# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: lde-la-h <lde-la-h@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2022/06/21 17:11:22 by lde-la-h      #+#    #+#                  #
#    Updated: 2022/06/28 14:47:11 by lde-la-h      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM debian:buster 

EXPOSE 9000

# Install deps
RUN apt update && apt-get upgrade -y && apt install -y php-fpm php-mysql

WORKDIR /tmp/

# Move to tmp directory
ENV BUILDDIR=/tmp/build/

# For some reason it doesn't make the folder, so lets make it because yes ?
RUN mkdir ${BUILDDIR} && mkdir -p /run/php

# Move the tools/resources to the working dir
COPY conf/ ${WORKDIR}

# Unpack wordpress && mv wp-config.php ${BUILDDIR} && mv index.php ${BUILDDIR}
RUN tar xzf wordpress-6.0.tar.gz --directory ${BUILDDIR} && \
	mv wp-config.php ${BUILDDIR} && \
	mv index.php ${BUILDDIR}

# Find and replace
RUN sed 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/' -i /etc/php/7.3/fpm/pool.d/www.conf

# Move the wp-cli to usr/bin/local
RUN chmod 777 wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp-cli
#RUN chmod -R 777 ${BUILDDIR}

# Move everything from builddir to /var/www and install the wordpress website
CMD cp -a ${BUILDDIR}. /var/www/ && \
	wp-cli core install --allow-root --title="Wordpress" --admin_name="balls" --admin_password="balls1234" --admin_email="balls@w2wizard.dev" --path="/var/www/wordpress/" --url="https://localhost/wordpress" && \
	wp-cli user delete --allow-root --yes bruh --path="/var/www/wordpress/" && \
	wp-cli user create --allow-root bruh bruh@w2wizard.dev --user_pass="balls1234" --path="/var/www/wordpress/" && \
	php-fpm7.3 -F -R