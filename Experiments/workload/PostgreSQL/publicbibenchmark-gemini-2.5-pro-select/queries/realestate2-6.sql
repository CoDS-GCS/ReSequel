
SELECT calculation222787466264023043,
       street,
       AVG(price) AS avgpriceok,
       COUNT(*) AS cntdateoftransferok,
       MAX(price)::bigint AS maxpriceok
FROM realestate25
WHERE county = 'GREATER LONDON'
  AND postcodedistrict = 'N2'
  AND dateoftransfer BETWEEN '1996-01-01' AND '2018-12-31'
  AND street ILIKE 'THE BISHOPS AVENUE'
GROUP BY 1,
         2;