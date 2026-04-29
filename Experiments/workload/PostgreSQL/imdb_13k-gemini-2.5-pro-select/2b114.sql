
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode')
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
AND k.keyword IN ('character-name-in-title',
                     'death',
                     'doctor',
                     'family-relationships',
                     'friendship',
                     'homosexual',
                     'husband-wife-relationship',
                     'jealousy',
                     'kidnapping',
                     'lesbian-sex',
                     'love',
                     'male-nudity',
                     'murder',
                     'new-york-city',
                     'non-fiction',
                     'one-word-title',
                     'revenge',
                     'sex',
                     'suicide')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('3')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
AND it2.id IN ('4')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('director',
                   'editor')
JOIN name AS n ON ci.person_id = n.id
AND (n.gender IN ('m')
     OR n.gender IS NULL)
WHERE t.production_year BETWEEN 1975 AND 2015
  AND mi1.info IN ('Action',
                    'Comedy',
                    'Crime',
                    'Documentary',
                    'Drama',
                    'Fantasy',
                    'History',
                    'Sci-Fi',
                    'Short')
  AND mi2.info IN ('Danish',
                    'English',
                    'Filipino',
                    'French',
                    'German',
                    'Greek',
                    'Japanese',
                    'None',
                    'Spanish',
                    'Swedish',
                    'Turkish');