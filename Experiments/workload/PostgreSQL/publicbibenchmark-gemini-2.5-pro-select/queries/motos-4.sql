
SELECT DISTINCT medio
FROM motos1
WHERE categoria = 'MOTOCICLETAS'
  AND marca IN ('MOTOCICLETAS YAMAHA', 'YAMAHA')
  AND EXTRACT(YEAR
              FROM fecha) >= 2010
  AND EXTRACT(YEAR
              FROM fecha) <= 2015
  AND EXTRACT(MONTH
              FROM fecha) BETWEEN 1 AND 9;