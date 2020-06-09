FROM oraclelinux:8.2


COPY ./docker/postgresql/bootstrap.sh ./bootstrap.sh
COPY ./docker/postgresql/run-postgres.sh ./run-postgres.sh

RUN sh bootstrap.sh

USER postgres

VOLUME [var/lib/pgsql/data/]

EXPOSE 5432
