
SELECT t.agname,
       t.fundingagencyname,
       t.level1category,
       t.yrsigneddateok
FROM
  (SELECT agname,
          fundingagencyname,
          level1category,
          CAST(EXTRACT(YEAR
                       FROM (CAST(signeddate AS DATE) + INTERVAL '3 month')) AS BIGINT) AS yrsigneddateok
   FROM commongovernment13) AS t
GROUP BY t.agname,
         t.fundingagencyname,
         t.level1category,
         t.yrsigneddateok;