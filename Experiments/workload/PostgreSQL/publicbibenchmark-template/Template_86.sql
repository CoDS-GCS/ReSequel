SELECT CAST(EXTRACT(MONTH
                    FROM motos1.fecha) AS BIGINT) AS mnfechaok
FROM motos1
WHERE ((motos1.categoria IN (N_SSS))
       AND (CAST(EXTRACT(YEAR
                         FROM motos1.fecha) AS BIGINT) >= 2010)
       AND (CAST(EXTRACT(YEAR
                         FROM motos1.fecha) AS BIGINT) <= 2015))
GROUP BY mnfechaok;