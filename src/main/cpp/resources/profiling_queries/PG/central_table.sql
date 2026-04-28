WITH inbound AS (
    SELECT
        con.confrelid AS table_oid,
        COUNT(*) AS inbound_fks
    FROM
        pg_constraint con
            JOIN pg_class ref_tbl ON ref_tbl.oid = con.confrelid
    WHERE
        con.contype = 'f'
      AND ref_tbl.relkind = 'r'
    GROUP BY con.confrelid
),
     outbound AS (
         SELECT
             con.conrelid AS table_oid,
             COUNT(*) AS outbound_fks
         FROM
             pg_constraint con
                 JOIN pg_class base_tbl ON base_tbl.oid = con.conrelid
         WHERE
             con.contype = 'f'
           AND base_tbl.relkind = 'r'
         GROUP BY con.conrelid
     )
SELECT
    n.nspname AS schema_name,
    c.relname AS table_name,
    COALESCE(i.inbound_fks, 0) AS inbound_fks,
    COALESCE(o.outbound_fks, 0) AS outbound_fks
FROM
    pg_class c
        JOIN pg_namespace n ON n.oid = c.relnamespace
        LEFT JOIN inbound i ON c.oid = i.table_oid
        LEFT JOIN outbound o ON c.oid = o.table_oid
WHERE
    c.relkind = 'r'
  AND n.nspname NOT IN ('pg_catalog', 'information_schema')
  AND c.relname IN ( $1)
ORDER BY
    inbound_fks DESC,
    outbound_fks ASC
    LIMIT 1;