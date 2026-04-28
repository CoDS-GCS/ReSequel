SELECT generico5.categoria AS categoria
FROM generico5
WHERE ((generico5.anunciante IN (N_SSS))
       AND (CAST(EXTRACT(YEAR
                         FROM generico5.fecha) AS BIGINT) >= 2010)
       AND (CAST(EXTRACT(YEAR
                         FROM generico5.fecha) AS BIGINT) <= 2015)
       AND (generico5.medio = &&&)
       AND ((CAST(EXTRACT(MONTH
                          FROM generico5.fecha) AS BIGINT) IS NULL)
            OR ((CAST(EXTRACT(MONTH
                              FROM generico5.fecha) AS BIGINT) >= 2)
                AND (CAST(EXTRACT(MONTH
                                  FROM generico5.fecha) AS BIGINT) <= 12)))
       AND (CAST(EXTRACT(YEAR
                         FROM generico5.fecha) AS BIGINT) = 2015))
GROUP BY generico5.categoria;