 
 
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('composer',
                   'director')
JOIN title AS t ON ci.movie_id = t.id
AND t.production_year BETWEEN 1950 AND 1990
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('tv series',
                   'video game',
                   'video movie')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info IN ('English',
                    'French',
                    'Spanish')
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('4')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info IN ('25',
                    '30',
                    '5',
                    '50',
                    '60',
                    '75',
                    '85',
                    '90',
                    'Argentina:30',
                    'UK:30',
                    'USA:30',
                    'USA:60')
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
AND it2.id IN ('1')
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE n.gender IS NULL;