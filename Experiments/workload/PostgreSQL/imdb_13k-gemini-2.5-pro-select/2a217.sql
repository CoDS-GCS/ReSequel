 
 WITH t_ci AS
  (SELECT t.id
   FROM title AS t
   JOIN cast_info AS ci ON t.id = ci.movie_id
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('m')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('cinematographer')
   JOIN kind_type AS kt ON t.kind_id = kt.id
   AND kt.kind IN ('tv series',
                   'video game',
                   'video movie')
   WHERE t.production_year BETWEEN 1950 AND 1990)
SELECT COUNT(*)
FROM t_ci
JOIN movie_info AS mi1 ON t_ci.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('4')
AND mi1.info IN ('English',
                    'French',
                    'Italian')
JOIN movie_info AS mi2 ON t_ci.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
AND it2.id IN ('18')
AND mi2.info IN ('ABC Television Center - 4151 Prospect Avenue, Los Angeles, California, USA',
                    'Hollywood, Los Angeles, California, USA',
                    'Paris, France',
                    'Rome, Lazio, Italy',
                    'Samuel Goldwyn Studios - 7200 Santa Monica Boulevard, West Hollywood, California, USA',
                    'San Francisco, California, USA',
                    'Stage 17, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 3, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Studio 8H, NBC Studios - 30 Rockefeller Plaza, Manhattan, New York City, New York, USA')
JOIN movie_keyword AS mk ON t_ci.id = mk.movie_id;