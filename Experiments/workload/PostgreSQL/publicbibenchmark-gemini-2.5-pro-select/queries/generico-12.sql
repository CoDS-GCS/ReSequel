
SELECT generico5.categoria
FROM generico5
WHERE generico5.fecha BETWEEN '2015-02-01' AND '2015-12-31'
  AND generico5.medio = 'TELEVISION NACIONAL'
  AND generico5.anunciante IN ('BANTRAB/TODOTICKET', 'TODOTICKET', 'TODOTICKET.COM')
GROUP BY generico5.categoria;