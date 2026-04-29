WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 2010
     AND kt.kind IN ('tv movie',
                   'video game'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info_type_id IN ('6')
  AND mi2.info IN ('DTS',
                    'Dolby Digital',
                    'Dolby SR',
                    'Dolby',
                    'Mono',
                    'Stereo')
  AND n.gender IN ('m')
  AND rt.role IN ('actor',
                   'miscellaneous crew')
  AND k.keyword IN ('character-name-in-title',
                     'dancing',
                     'doctor',
                     'father-son-relationship',
                     'female-frontal-nudity',
                     'female-nudity',
                     'friendship',
                     'male-frontal-nudity',
                     'marriage',
                     'mother-son-relationship',
                     'murder',
                     'new-york-city',
                     'nudity',
                     'revenge',
                     'tv-mini-series');