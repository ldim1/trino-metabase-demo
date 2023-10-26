`docker-compose up -d`

`docker exec -it trino-trino-1 trino`

_trino>_ `select * from postgresql.public.quote;`

_trino>_ `select * from mongodb.local.test;`

_trino>_ `select m.name, p.author from mongodb.local.test m join postgresql.public.quote p on m.extid = p.id;`

