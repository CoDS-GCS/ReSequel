
SELECT 1476 AS ctdagnameok,
       1476 AS ctdbureaunameok,
       1476 AS ctdconameok,
       1476 AS ctdfundingagencynameok,
       1476 AS ctdnaicscodeok,
       1476 AS ctdprodorservcodeok,
       1476 AS ctdrefidvidpiidok,
       s.sumnumberofrecordsok,
       s.sumobligatedamountok
FROM
  (SELECT COUNT(*) AS sumnumberofrecordsok,
          SUM(obligatedamount) AS sumobligatedamountok
   FROM commongovernment13) AS s
WHERE s.sumnumberofrecordsok > 0;