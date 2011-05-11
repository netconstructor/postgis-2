#!/bin/bash
# $Id$
PGPORT=5432
PGHOST=localhost
PGUSER=postgres
PGPASSWORD=yourpasswordhere
THEDB=geocoder
PSQL_CMD=/usr/bin/psql
PGCONTRIB=/usr/share/postgresql/contrib
${PSQL_CMD} -d "${THEDB}" -f "${PGCONTRIB}/fuzzystrmatch.sql"
${PSQL_CMD} -d "${THEDB}" -c "CREATE SCHEMA tiger"
${PSQL_CMD} -d "${THEDB}" -f "tables/lookup_tables_2010.sql"
${PSQL_CMD} -d "${THEDB}" -c "CREATE SCHEMA tiger_data"
${PSQL_CMD} -d "${THEDB}" -f "tiger_loader.sql"
${PSQL_CMD} -d "${THEDB}" -f "create_geocode.sql"