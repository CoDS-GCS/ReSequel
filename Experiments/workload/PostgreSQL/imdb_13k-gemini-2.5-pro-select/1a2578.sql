 
 WITH movie_subset AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game'))
SELECT COUNT(*)
FROM movie_subset
INNER JOIN movie_info mi1 ON movie_subset.id = mi1.movie_id
INNER JOIN info_type it1 ON mi1.info_type_id = it1.id
INNER JOIN movie_info mi2 ON movie_subset.id = mi2.movie_id
INNER JOIN info_type it2 ON mi2.info_type_id = it2.id
INNER JOIN cast_info ci ON movie_subset.id = ci.movie_id
INNER JOIN name n ON ci.person_id = n.id
INNER JOIN role_type rt ON ci.role_id = rt.id
WHERE it1.id IN ('18')
  AND mi1.info IN ('Budapest, Hungary',
                    'Desilu Studios - 9336 W. Washington Blvd., Culver City, California, USA',
                    'Orlando, Florida, USA',
                    'Stage 19, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 24, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 5, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA')
  AND it2.id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color')
  AND n.gender IS NULL
  AND rt.role IN ('cinematographer',
                   'editor',
                   'miscellaneous crew',
                   'production designer');