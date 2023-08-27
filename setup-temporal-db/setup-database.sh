
DB_PLUGIN=postgres # cassandra, mysql, postgres
DB_VERSION=v12 # v57, v8, v12
MAIN_DBNAME=temporal
VISIBILITY_DBNAME=temporal_visibility

MAIN_SCHEMA_DIR=schema/$DB_PLUGIN/$DB_VERSION/temporal/versioned
VISIBILITY_SCHEMA_DIR=schema/$DB_PLUGIN/$DB_VERSION/visibility/versioned

# main database
./temporal-sql-tool --tls --db "${MAIN_DBNAME}" create
./temporal-sql-tool --tls --db "${MAIN_DBNAME}" setup-schema -v 0.0
./temporal-sql-tool --tls --db "${MAIN_DBNAME}" update-schema -d "${MAIN_SCHEMA_DIR}"

# visibility database
./temporal-sql-tool --tls --db "${VISIBILITY_DBNAME}" create
./temporal-sql-tool --tls --db "${VISIBILITY_DBNAME}" setup-schema -v 0.0
./temporal-sql-tool --tls --db "${VISIBILITY_DBNAME}" update-schema -d "${VISIBILITY_SCHEMA_DIR}"
