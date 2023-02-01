FROM debian:stable

RUN apt-get update && apt-get install -y mariadb-server mariadb-client

# initialize MySQL data directory
# RUN mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

# creates missing directories
# RUN mkdir -p /run/mysqld

# creates directory that will receive script to create users (from docker-compose.yaml)
# RUN mkdir -p ./mariadb-conf


# ENTRYPOINT [ "mysqld", "--user=root" ]

# CMD [ "./mariadb-conf/entrypoint.sh" ]

ENTRYPOINT [ "./mariadb-conf/entrypoint.sh" ]

EXPOSE 3306