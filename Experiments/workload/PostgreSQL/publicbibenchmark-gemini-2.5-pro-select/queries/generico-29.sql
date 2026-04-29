WITH filtered_data AS
  (SELECT fecha
   FROM generico4
   WHERE fecha >= '2010-01-01'
     AND fecha < '2016-01-01'
     AND anunciante IN ('BANTRAB/TODOTICKET', 'TODOTICKET', 'TODOTICKET.COM'))
SELECT CAST(EXTRACT(MONTH
                    FROM fecha) AS BIGINT) AS mnfechaok
FROM filtered_data
GROUP BY 1
ORDER BY 1 ASC;