 
 
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
WHERE t.production_year BETWEEN 1875 AND 1975
  AND it1.id IN ('6')
  AND it2.id IN ('18')
  AND mi1.info IN ('Mono',
                    'Silent')
  AND mi2.info IN ('Buenos Aires, Federal District, Argentina',
                    'CBS Studio 50, New York City, New York, USA',
                    'Iverson Ranch - 1 Iverson Lane, Chatsworth, Los Angeles, California, USA',
                    'Mexico',
                    'New York City, New York, USA',
                    'Paris, France',
                    'Pinewood Studios, Iver Heath, Buckinghamshire, England, UK',
                    'Samuel Goldwyn Studios - 7200 Santa Monica Boulevard, West Hollywood, California, USA',
                    'Stage 9, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
  AND rt.role IN ('cinematographer')
  AND n.gender IS NULL;