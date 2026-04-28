SELECT realestate23.postcodedistrict AS postcodedistrict
FROM realestate23
WHERE ((realestate23.street ILIKE &&&)
       AND (realestate23.county = &&&)
       AND (realestate23.dateoftransfer >= cast('1996-01-01' AS DATE))
       AND (realestate23.dateoftransfer < cast('2019-01-01' AS DATE))
       AND (realestate23.propertytype <> &&&))
GROUP BY realestate23.postcodedistrict;