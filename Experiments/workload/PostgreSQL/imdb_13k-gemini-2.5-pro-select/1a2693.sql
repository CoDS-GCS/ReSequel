
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1950 AND 1990
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('movie',
                   'tv movie',
                   'tv series'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'costume designer',
                   'producer',
                   'writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('1')
  AND mi1.info IN ('100',
                    '109',
                    '22',
                    '59',
                    '69',
                    '81',
                    '84',
                    '89',
                    '91',
                    '97',
                    'USA:90')
  AND mi2.info_type_id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color');