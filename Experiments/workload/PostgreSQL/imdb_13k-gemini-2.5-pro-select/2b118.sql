
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
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND it1.id IN ('6')
  AND mi1.info IN ('Dolby Digital',
                    'Dolby SR',
                    'Stereo')
  AND it2.id IN ('3')
  AND mi2.info IN ('Adventure',
                    'Comedy',
                    'Documentary',
                    'Drama',
                    'Family',
                    'Fantasy',
                    'Music',
                    'Romance',
                    'Sci-Fi',
                    'Short')
  AND rt.role IN ('costume designer')
  AND n.gender IS NULL
  AND k.keyword IN ('blood',
                     'character-name-in-title',
                     'father-daughter-relationship',
                     'friendship',
                     'lesbian',
                     'love',
                     'male-nudity',
                     'mother-daughter-relationship',
                     'nudity',
                     'suicide');