
SELECT CAST(region AS BIGINT) AS region,
       CAST(st AS BIGINT) AS stss13pusacsv,
       COUNT(DISTINCT serialno) AS tempcalculation36816930274551398913377970810,
       COUNT(*) AS tempcalculation36816930274551398939677625720
FROM uscensus2
GROUP BY region,
         st;