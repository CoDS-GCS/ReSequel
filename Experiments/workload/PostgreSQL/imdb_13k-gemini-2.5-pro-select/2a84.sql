 
 
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv movie',
                   'tv series',
                   'video game'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('cinematographer',
                   'costume designer'))
  AND mi1.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('8'))
  AND mi1.info IN ('Argentina',
                    'UK',
                    'USA')
  AND mi2.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('5'))
  AND mi2.info IN ('Argentina:16',
                    'Australia:G',
                    'Canada:PG',
                    'Germany:6',
                    'Portugal:M/12',
                    'Sweden:15',
                    'UK:U',
                    'USA:X');