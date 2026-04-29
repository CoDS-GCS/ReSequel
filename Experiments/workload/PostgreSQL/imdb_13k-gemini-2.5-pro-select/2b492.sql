WITH mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('4')
     AND mi.info IN ('Arabic',
                    'Czech',
                    'Filipino',
                    'Georgian',
                    'Indonesian',
                    'Korean',
                    'Norwegian',
                    'Portuguese',
                    'Russian',
                    'Tamil',
                    'Telugu')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('2')
     AND mi.info IN ('Black and White',
                    'Color'))
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
WHERE t.production_year BETWEEN 1950 AND 2010
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND rt.role IN ('cinematographer',
                   'editor')
  AND n.gender IN ('f')
  AND k.keyword IN ('bare-chested-male',
                     'blood',
                     'cigarette-smoking',
                     'dog',
                     'female-frontal-nudity',
                     'fight',
                     'flashback',
                     'hardcore',
                     'homosexual',
                     'jealousy',
                     'lesbian-sex',
                     'love',
                     'male-frontal-nudity',
                     'tv-mini-series',
                     'violence');