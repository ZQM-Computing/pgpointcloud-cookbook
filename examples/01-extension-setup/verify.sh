#!/usr/bin/env bash
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SQL_FILE="$DIR/verify-extensions.sql"
command -v psql >/dev/null 2>&1 || { echo "psql is required" >&2; exit 127; }
[[ -s "$SQL_FILE" ]] || { echo "Missing SQL fixture: $SQL_FILE" >&2; exit 2; }
: "${PGHOST:?set PGHOST}"
: "${PGDATABASE:?set PGDATABASE}"
: "${PGUSER:?set PGUSER}"
echo "Checking PostGIS and pgPointCloud on host '$PGHOST', database '$PGDATABASE' as role '$PGUSER'."
echo "Authentication is delegated to libpq; credentials are not printed."
exec psql --no-psqlrc -X -v ON_ERROR_STOP=1 --set=VERBOSITY=verbose -f "$SQL_FILE"
