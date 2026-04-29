
SELECT DISTINCT yrsigneddateok
FROM
  (SELECT CAST(EXTRACT(YEAR
                       FROM (CAST(signeddate AS DATE) + INTERVAL '3 MONTH')) AS BIGINT) AS yrsigneddateok
   FROM commongovernment4) AS t;