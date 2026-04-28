SELECT generico5.categoria AS categoria
FROM generico5
WHERE ((generico5.anunciante IN (N_SSS))
       AND (CAST(EXTRACT(YEAR
                         FROM generico5.fecha) AS BIGINT) >= 2010)
       AND (CAST(EXTRACT(YEAR
                         FROM generico5.fecha) AS BIGINT) <= 2015)
       AND (CAST(EXTRACT(YEAR
                         FROM generico5.fecha) AS BIGINT) IN (2014,
                                                              2015))
       AND (generico5.medio = &&&)
       AND (generico5.vehiculo IN (N_SSS)))
GROUP BY generico5.categoria;