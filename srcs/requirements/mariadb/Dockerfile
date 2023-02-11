FROM debian:stable

RUN apt-get update && apt-get install -y mariadb-server mariadb-client

ENTRYPOINT [ "./entrypoint/entrypoint.sh" ]

EXPOSE 3306