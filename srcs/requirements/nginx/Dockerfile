# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: lde-la-h <lde-la-h@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2022/06/21 17:11:26 by lde-la-h      #+#    #+#                  #
#    Updated: 2022/06/24 12:12:20 by lde-la-h      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

EXPOSE 443
EXPOSE 80

# Install deps
RUN apt update && apt-get upgrade -y
RUN apt install nginx -y

WORKDIR /tmp/

ENV BUILDDIR=/tmp/web/
RUN mkdir ${BUILDDIR}

# Move the tools/resources to the working dir
COPY tools/ ${WORKDIR}

# Move all the garbage to the right place
RUN chmod 770 mkcert-v1.4.4 && \
	./mkcert-v1.4.4 -install && \
	./mkcert-v1.4.4 localhost && \
    mkdir -p /etc/nginx/ssl/ && \
    mv localhost.pem /etc/nginx/ssl/ && \
    mv localhost-key.pem /etc/nginx/ssl/ && \
    chmod -R 770 /etc/nginx/ssl/

# Move the config file and link it.
RUN rm -rf /etc/nginx/sites-enabled/* && \
	mv nginx.conf /etc/nginx/sites-available/nginx.conf && \
	ln -fs /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

# 
RUN mv website/* ${BUILDDIR} && rm -rf website
RUN chmod -R 777 ${BUILDDIR}
CMD cp -a ${BUILDDIR}. /var/www/ && nginx -g 'daemon off;'

# Run not as background task to keep container open.
#RUN cp -a ${BUILDDIR}. /var/www/
#CMD ["nginx", "-g", "daemon off;"]
#ENTRYPOINT ["tail", "-f", "/dev/null"]

