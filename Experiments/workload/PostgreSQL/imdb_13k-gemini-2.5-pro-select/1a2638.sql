 
 
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
                   'tv series',
                   'video game',
                   'video movie')
  AND it1.id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND it2.id IN ('18')
  AND mi2.info IN ('CBS Studio Center - 4024 Radford Avenue, Studio City, Los Angeles, California, USA',
                    'CBS Television City - 7800 Beverly Blvd., Fairfax, Los Angeles, California, USA',
                    'Hal Roach Studios - 8822 Washington Blvd., Culver City, California, USA',
                    'Iverson Ranch - 1 Iverson Lane, Chatsworth, Los Angeles, California, USA',
                    'Los Angeles, California, USA',
                    'Madrid, Spain',
                    'Mexico City, Distrito Federal, Mexico',
                    'New York City, New York, USA',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Revue Studios, Hollywood, Los Angeles, California, USA',
                    'Samuel Goldwyn Studios - 7200 Santa Monica Boulevard, West Hollywood, California, USA',
                    'Stage 3, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Universal Studios - 100 Universal City Plaza, Universal City, California, USA')
  AND rt.role IN ('director',
                   'producer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);