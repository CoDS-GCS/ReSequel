WITH mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('based-on-novel',
                     'character-name-in-title',
                     'death',
                     'dog',
                     'family-relationships',
                     'flashback',
                     'independent-film',
                     'jealousy',
                     'kidnapping',
                     'lesbian',
                     'love',
                     'male-frontal-nudity',
                     'male-nudity',
                     'marriage',
                     'murder',
                     'non-fiction',
                     'nudity',
                     'revenge',
                     'song',
                     'suicide'))
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
WHERE t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('movie',
                   'tv movie')
  AND it1.id IN ('4')
  AND mi1.info IN ('English',
                    'Filipino',
                    'French',
                    'German',
                    'Japanese',
                    'Korean',
                    'Portuguese',
                    'Tagalog',
                    'Turkish')
  AND it2.id IN ('8')
  AND mi2.info IN ('Brazil',
                    'East Germany',
                    'France',
                    'Japan',
                    'Philippines',
                    'South Korea',
                    'Turkey',
                    'USA')
  AND rt.role IN ('writer')
  AND n.gender IN ('f');