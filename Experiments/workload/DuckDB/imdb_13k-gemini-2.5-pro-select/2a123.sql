
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv movie',
                   'tv series',
                   'video game'))
  AND mi1.info_type_id IN ('1')
  AND mi2.info_type_id IN ('8')
  AND mi1.info IN ('19',
                    '2',
                    '25',
                    '30',
                    '60',
                    '75',
                    '89',
                    '90',
                    'USA:120',
                    'USA:15',
                    'USA:7')
  AND mi2.info IN ('UK',
                    'USA')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'producer'))
  AND (n.gender IN ('m')
       OR n.gender IS NULL);