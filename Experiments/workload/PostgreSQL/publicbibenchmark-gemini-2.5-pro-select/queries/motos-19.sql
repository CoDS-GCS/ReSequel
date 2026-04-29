WITH filtered_motos AS
  (SELECT fecha
   FROM motos1
   WHERE categoria IN ('CAMIONES', 'CAMIONES, BUSES Y PANELES', 'MOTOCICLETAS', 'PICK UPS, VANS Y JEEPS', 'PICK-UPS', 'SUV Y JEEPS', 'VEHICULOS NUEVOS')
     AND fecha >= '2010-01-01'
     AND fecha < '2016-01-01')
SELECT EXTRACT(MONTH
               FROM fecha) AS mnfechaok
FROM filtered_motos
GROUP BY mnfechaok;