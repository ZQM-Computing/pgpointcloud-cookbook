\set ON_ERROR_STOP on

SELECT current_database() AS database_name,
       current_user AS database_role,
       version() AS postgresql_version;

DO $verify_extensions$
DECLARE
    missing_extensions text;
BEGIN
    SELECT string_agg(required.name, ', ' ORDER BY required.name)
      INTO missing_extensions
      FROM (VALUES ('postgis'), ('pointcloud')) AS required(name)
     WHERE NOT EXISTS (
         SELECT 1
           FROM pg_extension AS installed
          WHERE installed.extname = required.name
     );

    IF missing_extensions IS NOT NULL THEN
        RAISE EXCEPTION 'Required extensions are not installed: %', missing_extensions
            USING HINT = 'Ask a database administrator to install the server-side extension packages, then run CREATE EXTENSION in this database.';
    END IF;
END
$verify_extensions$;

SELECT extname AS extension_name,
       extversion AS extension_version
  FROM pg_extension
 WHERE extname IN ('postgis', 'pointcloud')
 ORDER BY extname;
