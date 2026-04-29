 
 
SELECT COUNT(*)
FROM cast_info AS ci
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('f',
                    'm')
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('director',
                   'production designer')
JOIN title AS t ON ci.movie_id = t.id
AND t.production_year BETWEEN 1875 AND 1975
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('tv series',
                   'video game',
                   'video movie')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('8')
AND mi1.info IN ('Belgium',
                    'Czechoslovakia',
                    'East Germany',
                    'Taiwan',
                    'USA',
                    'West Germany')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
AND it2.id IN ('7')
AND mi2.info IN ('LAB:DeLuxe',
                    'MET:200 m',
                    'OFM:16 mm',
                    'OFM:35 mm',
                    'PFM:35 mm',
                    'RAT:1.33 : 1',
                    'RAT:2.35 : 1')
JOIN movie_keyword AS mk ON t.id = mk.movie_id;