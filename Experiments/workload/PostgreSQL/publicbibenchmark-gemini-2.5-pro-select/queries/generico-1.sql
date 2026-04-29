
SELECT categoria
FROM generico1
WHERE anunciante IN ('BANTRAB/TODOTICKET', 'TODOTICKET', 'TODOTICKET.COM')
  AND a_o >= 2010
  AND a_o <= 2015
GROUP BY categoria
ORDER BY categoria ASC;