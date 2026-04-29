
SELECT generico5.anunciante AS datoscopia,
       EXTRACT(MONTH
               FROM generico5.fecha) AS mnfechaok,
       SUM(generico5.inversionus) AS sumcalculation0061002123102817ok,
       EXTRACT(YEAR
               FROM generico5.fecha) AS yrfechaok
FROM generico5
WHERE (generico5.anunciante IN ('BANTRAB/TODOTICKET', 'TODOTICKET', 'TODOTICKET.COM'))
  AND (EXTRACT(YEAR
               FROM generico5.fecha) IN (2014,
                                         2015))
GROUP BY generico5.anunciante,
         mnfechaok,
         yrfechaok;