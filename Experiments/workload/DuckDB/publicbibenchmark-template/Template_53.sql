SELECT motos1.marca AS datoscopia
FROM motos1
WHERE ((motos1.categoria IN (N_SSS))
       AND (CAST(EXTRACT(YEAR
                         FROM motos1.fecha) AS BIGINT) >= 2010)
       AND (CAST(EXTRACT(YEAR
                         FROM motos1.fecha) AS BIGINT) <= 2015))
GROUP BY motos1.marca
ORDER BY datoscopia ASC ;