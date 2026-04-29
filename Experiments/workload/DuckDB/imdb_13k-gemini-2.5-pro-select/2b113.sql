
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN info_type AS it1 ON it1.id IN ('3')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
AND it2.id IN ('7')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON k.id = mk.keyword_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND mi1.info IN ('Adventure',
                    'Crime',
                    'Drama',
                    'War')
  AND mi2.info IN ('CAM:Panavision Cameras and Lenses',
                    'OFM:35 mm',
                    'PFM:35 mm',
                    'RAT:2.35 : 1')
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND rt.role IN ('composer',
                   'writer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND k.keyword IN ('bare-chested-male',
                     'based-on-novel',
                     'character-name-in-title',
                     'doctor',
                     'family-relationships',
                     'father-son-relationship',
                     'gun',
                     'homosexual',
                     'lesbian-sex',
                     'mother-son-relationship',
                     'nudity',
                     'singer',
                     'violence');