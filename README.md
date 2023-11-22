# Mongo and Postgres query federation

`docker-compose up -d`

`docker exec -it trino-trino-1 trino`

_trino>_ `SELECT * FROM postgresql.public.quote;`

_trino>_ `SELECT * FROM mongodb.local.test;`

_trino>_ `SELECT m.name, p.author FROM mongodb.local.test m JOIN postgresql.public.quote p ON m.extid = p.id;`

# S3 data lake definition

_trino>_ `CREATE SCHEMA s3.schema;`

_trino>_ `CREATE TABLE s3.schema.user(email VARCHAR, id VARCHAR, first VARCHAR, last VARCHAR)
WITH (
external_location = 's3a://bucket/user/',
format = 'CSV',
csv_separator = ';',
skip_header_line_count=1);`

_trino>_ `CREATE TABLE s3.schema.detail(id VARCHAR, access VARCHAR, recovery VARCHAR, department VARCHAR, location VARCHAR)
WITH (
external_location = 's3a://bucket/detail/',
format = 'CSV',
csv_separator = ';',
skip_header_line_count=1);`

_trino>_ `SELECT * FROM s3.schema.user;`

_trino>_ `SELECT * FROM s3.schema.detail;`

_trino>_ `SELECT u.id, u.first, d.location FROM s3.schema.user u JOIN s3.schema.detail d ON d.id = u.id;`


# BigQuery

## For local use:

###### Setup gcloud client https://cloud.google.com/sdk/docs/install

`gcloud auth application-default login`

_trino>_ `SELECT * FROM bq.dataset1.extra;`

# Useful links

https://github.com/starburstdata/metabase-driver