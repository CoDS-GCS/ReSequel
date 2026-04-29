WITH filtered_realestate AS
  (SELECT street,
          price,
          dateoftransfer
   FROM realestate26
   WHERE county = 'GREATER LONDON'
     AND postcodedistrict = 'N2'
     AND street ILIKE 'THE BISHOPS AVENUE'
     AND dateoftransfer >= '1996-01-01'::date
     AND dateoftransfer < '2019-01-01'::date)
SELECT street,
       AVG(price) AS avgpriceok,
       EXTRACT(MONTH
               FROM dateoftransfer) AS mndateoftransferok
FROM filtered_realestate
GROUP BY street,
         EXTRACT(MONTH
                 FROM dateoftransfer);