
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
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('cinematographer',
                   'guest',
                   'producer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info_type_id IN ('8')
  AND mi2.info IN ('Australia',
                    'France',
                    'Greece',
                    'Italy',
                    'Portugal',
                    'UK');