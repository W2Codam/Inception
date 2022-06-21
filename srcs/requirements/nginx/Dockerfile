FROM debian:buster

# Install deps
RUN apt update && apt-get upgrade -y
RUN apt install nginx -y

ENV BUILDDIR=/tmp/build/
RUN mkdir ${BUILDDIR}

# Move the tools/resources to the working dir
COPY tools/ ${BUILDDIR}

WORKDIR /tmp/build/

# Move all the garbage to the right place
RUN chmod 770 mkcert-v1.4.4 && ./mkcert-v1.4.4 -install && ./mkcert-v1.4.4 localhost && \
    mkdir -p /etc/nginx/ssl/ && \
    mv localhost.pem /etc/nginx/ssl/ && \
    mv localhost-key.pem /etc/nginx/ssl/ && \
    chmod -R 770 /etc/nginx/ssl/

# Move the config file and link it.
RUN rm -rf /etc/nginx/sites-enabled/* && \
	mv nginx.conf /etc/nginx/sites-available/nginx.conf && \
	ln -fs /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

# So linux can stfu about any permissions
RUN chmod -R 777 ${BUILDDIR} && cp -a ${BUILDDIR}. /var/

# Move it all from a build dir to /var/www/. Run not as background task to keep container open.
CMD ["nginx", "-g", "daemon off;"]