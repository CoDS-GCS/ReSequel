
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1925 AND 1975
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video game',
                   'video movie')
  AND it1.id IN ('5')
  AND mi1.info IN ('Australia:G',
                    'Australia:M',
                    'Finland:K-18',
                    'Finland:S',
                    'Germany:BPjM Restricted',
                    'Italy:VM18',
                    'Netherlands:18',
                    'Norway:18',
                    'Spain:18',
                    'Sweden:15',
                    'UK:12',
                    'UK:AA',
                    'UK:PG',
                    'USA:TV-G',
                    'West Germany:6')
  AND it2.id IN ('1')
  AND mi2.info IN ('104',
                    '110',
                    '6',
                    '68',
                    '69',
                    '72',
                    '74',
                    '77',
                    '84',
                    '86',
                    '89',
                    '93',
                    'Argentina:30')
  AND n.gender IS NULL
  AND rt.role IN ('costume designer',
                   'editor',
                   'miscellaneous crew',
                   'producer');