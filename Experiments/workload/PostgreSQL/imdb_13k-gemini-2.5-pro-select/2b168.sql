
SELECT COUNT(*)
FROM
  (SELECT mk.movie_id
   FROM keyword AS k
   JOIN movie_keyword AS mk ON k.id = mk.keyword_id
   WHERE k.keyword IN ('bare-chested-male',
                     'based-on-play',
                     'character-name-in-title',
                     'dancing',
                     'death',
                     'doctor',
                     'family-relationships',
                     'father-son-relationship',
                     'female-frontal-nudity',
                     'fight',
                     'friendship',
                     'gay',
                     'homosexual',
                     'interview',
                     'jealousy',
                     'sequel',
                     'sex',
                     'singer',
                     'singing')) AS filtered_mk
JOIN title AS t ON filtered_mk.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1950 AND 2010
  AND kt.kind IN ('episode',
                   'movie')
  AND it1.id IN ('7')
  AND mi1.info IN ('CAM:Arriflex Cameras',
                    'LAB:FotoKem Laboratory, Burbank (CA), USA',
                    'OFM:35 mm',
                    'PCS:Spherical',
                    'PCS:Super 16',
                    'PCS:Super 35',
                    'PFM:16 mm',
                    'PFM:Video',
                    'RAT:1.33 : 1',
                    'RAT:1.37 : 1',
                    'RAT:1.78 : 1 / (high definition)',
                    'RAT:2.35 : 1')
  AND it2.id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color')
  AND rt.role IN ('actor',
                   'director')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);