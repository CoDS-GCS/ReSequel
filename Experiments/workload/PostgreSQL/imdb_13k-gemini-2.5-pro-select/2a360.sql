 
 
SELECT COUNT(*)
FROM movie_info AS mi1
JOIN movie_info AS mi2 ON mi1.movie_id = mi2.movie_id
JOIN cast_info AS ci ON mi1.movie_id = ci.movie_id
JOIN title AS t ON mi1.movie_id = t.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND it1.id IN ('4')
  AND it2.id IN ('18')
  AND mi1.info IN ('English')
  AND mi2.info IN ('Dublin, County Dublin, Ireland',
                    'Midwest Street, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Minneapolis, Minnesota, USA',
                    'New Jersey, USA',
                    'Phoenix, Arizona, USA',
                    'Portland, Oregon, USA',
                    'Santa Monica, California, USA',
                    'Stage 25, Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Stage 7, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'UK')
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND rt.role IN ('composer')
  AND n.gender IS NULL;