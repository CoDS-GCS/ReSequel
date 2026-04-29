 
 WITH filtered_kt AS
  (SELECT id
   FROM kind_type
   WHERE kind IN ('tv movie',
                   'tv series',
                   'video game')),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('costume designer')),
     filtered_it1 AS
  (SELECT id
   FROM info_type
   WHERE id IN ('3')),
     filtered_it2 AS
  (SELECT id
   FROM info_type
   WHERE id IN ('6'))
SELECT COUNT(*)
FROM title AS t
JOIN filtered_kt AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN filtered_it1 AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN filtered_it2 AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND n.gender IS NULL
  AND mi1.info IN ('Action',
                    'Adult',
                    'Biography',
                    'Comedy',
                    'Family',
                    'Music',
                    'Musical',
                    'Mystery',
                    'Romance',
                    'Sport',
                    'War')
  AND mi2.info IN ('DTS',
                    'Dolby Digital',
                    'Dolby SR',
                    'Dolby',
                    'Mono',
                    'SDDS',
                    'Stereo');