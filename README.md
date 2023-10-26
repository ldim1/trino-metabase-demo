`docker-compose up -d`

`docker exec -it trino-trino-1 trino`

_trino>_ `SELECT * FROM postgresql.public.quote;`

_trino>_ `SELECT * FROM mongodb.local.test;`

_trino>_ `SELECT m.name, p.author FROM mongodb.local.test m JOIN postgresql.public.quote p ON m.extid = p.id;`

