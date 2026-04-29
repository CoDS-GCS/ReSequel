
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON k.id = mk.keyword_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id IN ('8')
AND mi1.info IN ('France',
                    'UK',
                    'USA')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id IN ('1')
AND mi2.info IN ('100',
                    '30',
                    '60',
                    '75',
                    '90',
                    'UK:30',
                    'USA:30',
                    'USA:60')
WHERE t.production_year BETWEEN 1950 AND 1990
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
  AND n.gender IS NULL
  AND rt.role IN ('costume designer',
                   'production designer');