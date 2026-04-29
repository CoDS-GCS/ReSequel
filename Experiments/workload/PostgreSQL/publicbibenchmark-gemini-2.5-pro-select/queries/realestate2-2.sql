
SELECT calculation222787466264023043,
       calculation342484700263473152,
       dateoftransfer,
       street,
       AVG(latitude::double precision) AS avglatitudeok,
       AVG(longitude) AS avglongitudeok,
       AVG(price::double precision) AS avgpriceok,
       dateoftransfer AS mindateoftransferok,
       town_city_url_string__copy_
FROM realestate23
WHERE county = 'GREATER LONDON'
  AND postcodedistrict = 'N2'
  AND lower(street) LIKE lower('THE BISHOPS AVENUE')
  AND dateoftransfer BETWEEN '1996-01-01' AND '2018-12-31'
GROUP BY calculation222787466264023043,
         calculation342484700263473152,
         dateoftransfer,
         street,
         town_city_url_string__copy_;