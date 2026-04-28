SELECT generico1.categoria AS categoria
FROM generico1
WHERE ((generico1.anunciante IN (N_SSS))
       AND (CAST(EXTRACT(YEAR
                         FROM generico1.fecha) AS BIGINT) >= 2010)
       AND (CAST(EXTRACT(YEAR
                         FROM generico1.fecha) AS BIGINT) <= 2015))
GROUP BY generico1.categoria
ORDER BY categoria ASC ;