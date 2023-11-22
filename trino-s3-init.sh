set -e

java -jar trino.jar <<EOF

CREATE SCHEMA s3.schema;

CREATE TABLE s3.schema.user(email VARCHAR, id VARCHAR, first VARCHAR, last VARCHAR) WITH ( external_location = 's3a://bucket/user/', format = 'CSV', csv_separator = ';', skip_header_line_count=1);

CREATE TABLE s3.schema.detail(id VARCHAR, access VARCHAR, recovery VARCHAR, department VARCHAR, location VARCHAR) WITH ( external_location = 's3a://bucket/detail/', format = 'CSV', csv_separator = ';', skip_header_line_count=1);

EOF