WITH movie_ids AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND kt.kind IN ('episode',
                   'tv movie',
                   'video game',
                   'video movie'))
SELECT COUNT(*)
FROM movie_ids
JOIN cast_info AS ci ON movie_ids.id = ci.movie_id
JOIN movie_info AS mi1 ON movie_ids.id = mi1.movie_id
JOIN movie_info AS mi2 ON movie_ids.id = mi2.movie_id
WHERE ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'actress',
                   'composer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('17')
  AND mi1.info IN ('Last show of the series.')
  AND mi2.info_type_id IN ('1')
  AND mi2.info IN ('109',
                    '114',
                    '84',
                    '90',
                    '98',
                    'USA:90');