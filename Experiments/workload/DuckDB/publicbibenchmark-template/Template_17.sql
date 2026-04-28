SELECT arade1.f4 AS f4
FROM arade1
WHERE ((CAST(arade1.f3 AS DATE) >= cast('2014-10-17' AS DATE))
       AND (CAST(arade1.f3 AS DATE) <= cast('2015-10-16' AS DATE)))
GROUP BY f4
LIMIT ###;