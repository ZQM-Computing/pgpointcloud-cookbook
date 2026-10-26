# Verify PostgreSQL and pgPointCloud extensions

This pattern checks that the target PostgreSQL database can load PostGIS and pgPointCloud and reports the installed extension versions. It deliberately does **not** use `PC_MakePoint`: the cookbook's documented pgPointCloud 1.2.5 fleet build has a known constructor defect, so point data should be ingested through a compatible PDAL pipeline instead.

## Prerequisites

- PostgreSQL with PostGIS and pgPointCloud installed on the server
- `psql` on the client
- A role allowed to connect and read `pg_extension`; extension creation is an optional separate administrative step

## Run

Set `PGHOST`, `PGPORT`, `PGDATABASE`, `PGUSER`, and authentication through your normal PostgreSQL credential mechanism (for example, `PGPASSFILE`). Then run:

```bash
psql -X -v ON_ERROR_STOP=1 -f examples/01-extension-setup/verify-extensions.sql
```

The query fails if either extension is absent and prints the exact installed versions otherwise. It is intentionally a verification script, not an automatic privileged extension installer. Extension installation and upgrades should follow the database administrator's change process.

## Validation boundary

CI checks the SQL contract and shell syntax. A successful static check does not prove the extensions exist on your database; run the command against the target server to establish that.
