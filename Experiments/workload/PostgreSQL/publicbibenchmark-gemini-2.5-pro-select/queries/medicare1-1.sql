WITH CastedData AS
  (SELECT specialtydesc,
          CAST(calculation3170826185505725 AS DOUBLE PRECISION) AS calc
   FROM medicare11)
SELECT specialtydesc,
       AVG(calc) AS avgcalculation3170826185505725ok
FROM CastedData
GROUP BY specialtydesc
ORDER BY avgcalculation3170826185505725ok DESC
LIMIT 15;