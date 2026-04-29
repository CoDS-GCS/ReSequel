
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'editor',
                   'guest'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('1')
  AND mi1.info IN ('112',
                    '115',
                    '120',
                    '16',
                    '58',
                    '64',
                    '80',
                    '98',
                    'USA:17',
                    'USA:60',
                    'West Germany:90')
  AND mi2.info_type_id IN ('3')
  AND mi2.info IN ('Adult',
                    'Crime',
                    'Family',
                    'Horror',
                    'War',
                    'Western');