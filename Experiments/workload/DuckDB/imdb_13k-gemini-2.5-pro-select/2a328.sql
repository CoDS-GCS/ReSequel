
SELECT COUNT(*)
FROM cast_info AS ci
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON k.id = mk.keyword_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE n.gender IS NULL
  AND rt.role IN ('production designer')
  AND t.production_year BETWEEN 1950 AND 1990
  AND kt.kind IN ('tv series',
                   'video game',
                   'video movie')
  AND it1.id IN ('1')
  AND mi1.info IN ('100',
                    '12',
                    '24',
                    '50',
                    '6',
                    '70',
                    '78',
                    '8',
                    '81',
                    '95',
                    'USA:90')
  AND it2.id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color');