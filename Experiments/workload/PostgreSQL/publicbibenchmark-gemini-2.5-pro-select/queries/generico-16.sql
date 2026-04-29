
SELECT categoria
FROM generico5
WHERE anunciante IN ('BANTRAB/TODOTICKET', 'TODOTICKET', 'TODOTICKET.COM')
  AND medio = 'RADIO'
  AND fecha >= '2014-01-01'
  AND fecha < '2014-06-01'
GROUP BY categoria
UNION
SELECT categoria
FROM generico5
WHERE anunciante IN ('BANTRAB/TODOTICKET', 'TODOTICKET', 'TODOTICKET.COM')
  AND medio = 'RADIO'
  AND fecha >= '2015-01-01'
  AND fecha < '2015-06-01'
GROUP BY categoria;