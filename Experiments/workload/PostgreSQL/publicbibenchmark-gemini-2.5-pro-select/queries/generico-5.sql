
SELECT DISTINCT g.anunciante AS datoscopia
FROM generico5 AS g
WHERE g.anunciante IN ('BANTRAB/TODOTICKET', 'TODOTICKET', 'TODOTICKET.COM')
  AND CAST(EXTRACT(YEAR
                   FROM g.fecha) AS BIGINT) >= 2010
  AND CAST(EXTRACT(YEAR
                   FROM g.fecha) AS BIGINT) <= 2015
ORDER BY datoscopia ASC;