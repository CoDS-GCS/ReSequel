 
 
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
WHERE t.production_year BETWEEN 1925 AND 1975
  AND it1.id IN ('8')
  AND it2.id IN ('18')
  AND mi1.info IN ('Spain',
                    'USA')
  AND mi2.info IN ('CBS Studio Center - 4024 Radford Avenue, Studio City, Los Angeles, California, USA',
                    'Madrid, Spain',
                    'Republic Studios - 4024 Radford Avenue, North Hollywood, Los Angeles, California, USA',
                    'Revue Studios, Hollywood, Los Angeles, California, USA',
                    'Stage 3, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Stage 9, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
  AND rt.role IN ('cinematographer',
                   'miscellaneous crew')
  AND n.gender IS NULL;