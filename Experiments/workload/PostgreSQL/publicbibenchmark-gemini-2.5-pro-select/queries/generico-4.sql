
SELECT anunciante,
       anunciante AS datoscopia,
       SUM(inversionus) AS temptc26225288700,
       SUM(inversionus) AS sumcalculation0061002123102817ok,
       CAST(EXTRACT(YEAR
                    FROM fecha) AS BIGINT) AS yrfechaok
FROM generico5
WHERE anunciante IN ('BANTRAB/TODOTICKET', 'TODOTICKET', 'TODOTICKET.COM')
  AND fecha BETWEEN '2010-01-01' AND '2015-12-31'
GROUP BY anunciante,
         yrfechaok;