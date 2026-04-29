
SELECT categoria
FROM generico5
WHERE a_o IN (2014,
              2015)
  AND medio = 'PRENSA'
  AND anunciante IN ('BANTRAB/TODOTICKET', 'TODOTICKET', 'TODOTICKET.COM')
  AND vehiculo IN ('Al Dia', 'El Periodico', 'Nuestro Diario', 'Prensa Libre', 'Siglo Veintiuno')
GROUP BY categoria;