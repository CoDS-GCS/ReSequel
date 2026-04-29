
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1950 AND 1990
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
     WHERE ROLE IN ('actor',
                   'actress',
                   'composer',
                   'guest',
                   'miscellaneous crew'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('1')
  AND mi1.info IN ('127',
                    '130',
                    '136',
                    '79',
                    '81',
                    '90',
                    '93',
                    '94',
                    'Argentina:60',
                    'USA:60')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Australia:MA',
                    'Australia:PG',
                    'Canada:13+',
                    'Canada:G',
                    'France:-16',
                    'Iceland:16',
                    'Sweden:15',
                    'Sweden:Btl',
                    'UK:PG',
                    'UK:U',
                    'UK:X',
                    'USA:PG');