WITH mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('anal-sex',
                     'bare-breasts',
                     'bare-chested-male',
                     'character-name-in-title',
                     'flashback',
                     'gun',
                     'homosexual',
                     'male-frontal-nudity',
                     'male-nudity',
                     'mother-son-relationship',
                     'number-in-title',
                     'police',
                     'tv-mini-series'))
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
JOIN mk_filtered AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND it1.id IN ('6')
  AND mi1.info IN ('DTS',
                    'Dolby Digital',
                    'Dolby SR',
                    'SDDS',
                    'Stereo')
  AND it2.id IN ('3')
  AND mi2.info IN ('Action',
                    'Animation',
                    'Biography',
                    'Documentary',
                    'Drama',
                    'Musical',
                    'Romance',
                    'Sport',
                    'War')
  AND rt.role IN ('composer')
  AND n.gender IN ('f');