 
 
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('cinematographer')
JOIN title AS t ON ci.movie_id = t.id
AND t.production_year BETWEEN 1975 AND 2015
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('tv movie',
                   'video game')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info IN ('CBS Studio Center - 4024 Radford Avenue, Studio City, Los Angeles, California, USA',
                    'Los Angeles, California, USA',
                    'Metromedia Square - 5746 W. Sunset Blvd., Hollywood, Los Angeles, California, USA',
                    'New York City, New York, USA',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Paris, France',
                    'Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA')
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('18')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info IN ('OFM:35 mm',
                    'PFM:35 mm',
                    'PFM:Video',
                    'RAT:1.33 : 1',
                    'RAT:1.78 : 1',
                    'RAT:16:9 HD',
                    'RAT:2.35 : 1')
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
AND it2.id IN ('7')
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE n.gender IS NULL;