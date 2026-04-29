
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
AND k.keyword IN ('based-on-novel',
                     'based-on-play',
                     'death',
                     'family-relationships',
                     'father-daughter-relationship',
                     'flashback',
                     'friendship',
                     'gun',
                     'interview',
                     'non-fiction',
                     'singing',
                     'surrealism')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('6')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
AND it2.id IN ('8')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('director',
                   'miscellaneous crew')
JOIN name AS n ON ci.person_id = n.id
AND (n.gender IN ('m')
     OR n.gender IS NULL)
WHERE t.production_year BETWEEN 1950 AND 2010
  AND mi1.info IN ('Dolby Digital',
                    'Dolby',
                    'Mono',
                    'Silent',
                    'Stereo',
                    'Ultra Stereo')
  AND mi2.info IN ('Argentina',
                    'Australia',
                    'Austria',
                    'Canada',
                    'France',
                    'Germany',
                    'India',
                    'Mexico',
                    'Poland',
                    'USA');