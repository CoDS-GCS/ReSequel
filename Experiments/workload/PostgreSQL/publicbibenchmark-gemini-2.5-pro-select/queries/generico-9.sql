
SELECT generico5.anunciante AS datoscopia,
       MAX(generico5.vehiculo) AS tempattrvehiculonk16626454430,
       MIN(generico5.vehiculo) AS tempattrvehiculonk5366548160,
       CAST(EXTRACT(MONTH
                    FROM generico5.fecha) AS BIGINT) AS mnfechaok,
       SUM(CAST(generico5.numanuncios AS BIGINT)) AS sumnumanunciosok,
       CAST(EXTRACT(YEAR
                    FROM generico5.fecha) AS BIGINT) AS yrfechaok
FROM generico5
WHERE generico5.anunciante IN ('BANTRAB/TODOTICKET', 'TODOTICKET', 'TODOTICKET.COM')
  AND generico5.medio = 'TELEVISION NACIONAL'
  AND CAST(EXTRACT(YEAR
                   FROM generico5.fecha) AS BIGINT) = 2015
  AND CAST(EXTRACT(MONTH
                   FROM generico5.fecha) AS BIGINT) >= 2
GROUP BY generico5.anunciante,
         mnfechaok,
         yrfechaok;