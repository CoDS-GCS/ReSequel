
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video game'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('costume designer',
                   'editor',
                   'miscellaneous crew',
                   'producer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('17')
  AND mi1.info IN ('Despite the fact that this was filmed in Super 35, "Filmed in Panavision" is listed in the end credits.',
                    'Despite the fact that this was filmed in the standard spherical format, "Filmed in Panavision" is listed in the end credits.',
                    'Premiere voted this movie as one of "The 25 Most Dangerous Movies".',
                    'Premiere voted this movie as one of "The 50 Greatest Comedies Of All Time" in 2006.')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Canada:G',
                    'Denmark:A',
                    'Hungary:18',
                    'Malaysia:18SX',
                    'New Zealand:PG',
                    'Peru:14',
                    'South Africa:16LV',
                    'Spain:13');