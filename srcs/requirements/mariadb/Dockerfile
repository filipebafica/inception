FROM debian:stable

RUN apt update && apt install mariadb-server mariadb-client bash -y

ARG MYSQL_DATABASE
ARG MYSQL_ROOT
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD


COPY tools /tmp/
RUN chmod a+x /tmp/setup.sh

RUN /tmp/setup.sh

EXPOSE 3306

CMD [ "mysqld", "--bind-address=0.0.0.0" ]
