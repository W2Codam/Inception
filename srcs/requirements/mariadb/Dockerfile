FROM debian:buster 

# Install deps
RUN apt update && apt-get upgrade -y
RUN apt install mariadb-server mariadb-client gettext-base -y

EXPOSE 3306

# ENTRYPOINT ["/bin/echo", "Welcome,"]
ENTRYPOINT ["tail", "-f", "/dev/null"]
