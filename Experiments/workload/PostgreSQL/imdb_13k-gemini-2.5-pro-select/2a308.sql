 
 
SELECT COUNT(*)
FROM cast_info AS ci
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('f',
                    'm')
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('cinematographer',
                   'editor')
JOIN title AS t ON ci.movie_id = t.id
AND t.production_year BETWEEN 1975 AND 2015
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('18')
AND mi1.info IN ('CBS Studio Center - 4024 Radford Avenue, Studio City, Los Angeles, California, USA',
                    'California, USA',
                    'France',
                    'Hamburg, Germany',
                    'Istanbul, Turkey',
                    'London, England, UK',
                    'Manhattan, New York City, New York, USA',
                    'Melbourne, Victoria, Australia',
                    'Montréal, Québec, Canada',
                    'Munich, Bavaria, Germany',
                    'San Diego, California, USA',
                    'Stage 37, Universal Studios - 100 Universal City Plaza, Universal City, California, USA',
                    'USA',
                    'Washington, District of Columbia, USA')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
AND it2.id IN ('2')
AND mi2.info IN ('Color')
JOIN movie_keyword AS mk ON t.id = mk.movie_id;