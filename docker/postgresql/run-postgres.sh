touch var/lib/pgsql/data/postgresql.conf
touch var/lib/pgsql/data/postgresql.auto.conf
touch var/lib/pgsql/data/PG_DATA

postgres -D /var/lib/pgsql/data -p 1234