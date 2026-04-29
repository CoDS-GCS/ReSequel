WITH mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('18')
     AND mi.info IN ('Detroit, Michigan, USA',
                    'Helsinki, Finland',
                    'Los Angeles, California, USA',
                    'Minneapolis, Minnesota, USA',
                    'Nashville, Tennessee, USA',
                    'Stage 10, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Tokyo, Japan')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('4')
     AND mi.info IN ('English',
                    'Finnish',
                    'Japanese',
                    'Spanish'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND rt.role IN ('composer')
  AND n.gender IN ('f')
  AND k.keyword IN ('bare-breasts',
                     'doctor',
                     'dog',
                     'friendship',
                     'homosexual',
                     'male-nudity',
                     'nudity',
                     'one-word-title',
                     'surrealism',
                     'violence');