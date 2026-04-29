
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
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('costume designer',
                   'director',
                   'production designer',
                   'writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('5')
  AND mi1.info IN ('Australia:M',
                    'Canada:G',
                    'Finland:K-12',
                    'Finland:K-13',
                    'Ireland:16',
                    'New Zealand:R13',
                    'Philippines:G',
                    'Philippines:PG-13',
                    'Portugal:M/16',
                    'Sweden:11')
  AND mi2.info_type_id IN ('1')
  AND mi2.info IN ('105',
                    '128',
                    '135',
                    '88',
                    'Argentina:95',
                    'USA:22',
                    'USA:82',
                    'USA:87');