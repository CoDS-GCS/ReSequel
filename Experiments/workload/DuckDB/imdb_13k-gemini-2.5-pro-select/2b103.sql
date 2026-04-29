WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('tv movie',
                   'tv series',
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
WHERE mi1.info_type_id IN ('1')
  AND mi1.info IN ('19',
                    '3',
                    '5',
                    '6',
                    '7',
                    '8',
                    '80',
                    'USA:7')
  AND mi2.info_type_id IN ('3')
  AND mi2.info IN ('Animation',
                    'Comedy',
                    'Drama',
                    'Short')
  AND n.gender IN ('f',
                    'm')
  AND rt.role IN ('actor',
                   'actress')
  AND k.keyword IN ('anal-sex',
                     'bare-breasts',
                     'dancing',
                     'dog',
                     'father-son-relationship',
                     'gun',
                     'hardcore',
                     'male-frontal-nudity',
                     'male-nudity',
                     'mother-daughter-relationship',
                     'murder',
                     'nudity',
                     'one-word-title',
                     'revenge',
                     'surrealism',
                     'tv-mini-series');