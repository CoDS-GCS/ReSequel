
SELECT COUNT(*)
FROM
  (SELECT mk.movie_id
   FROM keyword AS k
   JOIN movie_keyword AS mk ON k.id = mk.keyword_id
   WHERE k.keyword IN ('anal-sex',
                     'bare-breasts',
                     'bare-chested-male',
                     'based-on-novel',
                     'blood',
                     'character-name-in-title',
                     'dog',
                     'family-relationships',
                     'father-son-relationship',
                     'female-frontal-nudity',
                     'lesbian-sex',
                     'love',
                     'male-frontal-nudity',
                     'male-nudity',
                     'mother-son-relationship',
                     'murder',
                     'non-fiction',
                     'revenge',
                     'suicide')) AS filtered_mk
JOIN title AS t ON filtered_mk.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('tv movie',
                   'tv series')
  AND it1.id IN ('6')
  AND mi1.info IN ('DTS',
                    'Dolby Digital',
                    'Dolby SR',
                    'Dolby',
                    'Mono',
                    'Stereo',
                    'Ultra Stereo')
  AND it2.id IN ('8')
  AND mi2.info IN ('Argentina',
                    'France',
                    'Germany',
                    'Hong Kong',
                    'India',
                    'Italy',
                    'Netherlands',
                    'Spain',
                    'Sweden',
                    'UK',
                    'USA')
  AND rt.role IN ('composer',
                   'miscellaneous crew')
  AND (n.gender IN ('f')
       OR n.gender IS NULL);