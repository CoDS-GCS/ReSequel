 
 
SELECT COUNT(*)
FROM cast_info AS ci
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('f',
                    'm')
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('composer',
                   'editor')
JOIN title AS t ON ci.movie_id = t.id
AND t.production_year BETWEEN 1950 AND 1990
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('tv series',
                   'video movie')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('8')
AND mi1.info IN ('Mexico',
                    'USA')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
AND it2.id IN ('18')
AND mi2.info IN ('CBS Studio Center - 4024 Radford Avenue, Studio City, Los Angeles, California, USA',
                    'Desilu Studios - 9336 W. Washington Blvd., Culver City, California, USA',
                    'Los Angeles, California, USA',
                    'Mexico',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Universal Studios - 100 Universal City Plaza, Universal City, California, USA',
                    'Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA')
JOIN movie_keyword AS mk ON t.id = mk.movie_id;