
SELECT DISTINCT postcodedistrict
FROM
  (SELECT postcodedistrict,
          street,
          propertytype
   FROM realestate23
   WHERE county = 'GREATER LONDON'
     AND dateoftransfer >= '1996-01-01'
     AND dateoftransfer < '2019-01-01') AS sub
WHERE sub.propertytype <> 'O'
  AND sub.street ILIKE 'THE BISHOPS AVENUE';