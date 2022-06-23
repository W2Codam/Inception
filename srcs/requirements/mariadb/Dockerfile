# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: lde-la-h <lde-la-h@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2022/06/21 17:11:29 by lde-la-h      #+#    #+#                  #
#    Updated: 2022/06/23 13:54:36 by lde-la-h      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM debian:buster 

EXPOSE 3306

# Install deps
RUN apt update && apt-get upgrade -y
RUN apt install mariadb-server mariadb-client gettext-base -y

WORKDIR /tmp/mariadb/
COPY tools/ ${WORKDIR}

#RUN mkdir -p /run/mysql

# Start the database with the given setup.sql file
RUN service mysql start && mariadb -u root < /tmp/mariadb/setup.sql

# Find and replace the bind address
RUN sed 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/' -i /etc/mysql/mariadb.conf.d/50-server.cnf

#ENTRYPOINT ["tail", "-f", "/dev/null"]
CMD mysqld
