SELECT generico5.anunciante AS datoscopia,
       CAST(EXTRACT(MONTH
                    FROM generico5.fecha) AS BIGINT) AS mnfechaok,
       SUM(generico5.inversionus) AS sumcalculation0061002123102817ok,
       CAST(EXTRACT(YEAR
                    FROM generico5.fecha) AS BIGINT) AS yrfechaok
FROM generico5
WHERE ((generico5.anunciante IN (N_SSS))
       AND (CAST(EXTRACT(YEAR
                         FROM generico5.fecha) AS BIGINT) IN (2014,
                                                              2015)))
GROUP BY generico5.anunciante,
         mnfechaok,
         yrfechaok;