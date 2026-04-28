SELECT motos1.medio AS medio
FROM motos1
WHERE ( (motos1.categoria IN (N_SSS))
       AND (CAST(EXTRACT(YEAR
                         FROM motos1.fecha) AS BIGINT) >= 2010)
       AND (CAST(EXTRACT(YEAR
                         FROM motos1.fecha) AS BIGINT) <= 2015)
       AND (motos1.categoria = &&&)
       AND (motos1.marca IN (N_SSS))
       AND (CAST(EXTRACT(MONTH
                         FROM motos1.fecha) AS BIGINT) >= 1)
       AND (CAST(EXTRACT(MONTH
                         FROM motos1.fecha) AS BIGINT) <= 9))
GROUP BY motos1.medio;