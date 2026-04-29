 
 
SELECT COUNT(*)
FROM cast_info AS ci
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('m')
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('miscellaneous crew')
JOIN title AS t ON ci.movie_id = t.id
AND t.production_year BETWEEN 1925 AND 1975
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('6')
AND mi1.info IN ('Mono')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
AND it2.id IN ('5')
AND mi2.info IN ('Australia:G',
                    'Finland:K-16',
                    'Finland:S',
                    'Sweden:Btl',
                    'UK:A',
                    'UK:PG',
                    'USA:Approved',
                    'USA:Passed',
                    'USA:R',
                    'USA:TV-G',
                    'West Germany:12',
                    'West Germany:18')
JOIN movie_keyword AS mk ON t.id = mk.movie_id;