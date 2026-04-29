
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('cinematographer',
                   'editor',
                   'guest',
                   'miscellaneous crew'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('5')
  AND mi1.info IN ('Australia:MA15+',
                    'Brazil:16',
                    'Canada:16+',
                    'Canada:PA',
                    'Finland:K-14',
                    'Ireland:18',
                    'Italy:VM14',
                    'Singapore:R(A)',
                    'South Korea:15',
                    'UK:12A')
  AND mi2.info_type_id IN ('4')
  AND mi2.info IN ('Arabic',
                    'Cantonese',
                    'Czech',
                    'Finnish',
                    'Korean',
                    'Malayalam',
                    'Persian',
                    'Tamil',
                    'Telugu');