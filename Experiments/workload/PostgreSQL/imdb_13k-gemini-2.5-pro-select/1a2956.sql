
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
     WHERE ROLE IN ('director',
                   'production designer',
                   'writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('16')
  AND mi1.info IN ('Australia:1985',
                    'Australia:1986',
                    'USA:1984',
                    'USA:1985',
                    'USA:1987',
                    'USA:1989',
                    'USA:1990')
  AND mi2.info_type_id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color');