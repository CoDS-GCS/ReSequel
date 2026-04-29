
SELECT MIN(t.prodorservcodedesc) AS tempattrprodorservcodedescnk10452434690,
       MAX(t.prodorservcodedesc) AS tempattrprodorservcodedescnk36110301380,
       t.prodorservcode,
       COUNT(*) AS sumnumberofrecordsok,
       SUM(t.obligatedamount) AS sumobligatedamountok
FROM commongovernment11 AS t
GROUP BY t.prodorservcode;