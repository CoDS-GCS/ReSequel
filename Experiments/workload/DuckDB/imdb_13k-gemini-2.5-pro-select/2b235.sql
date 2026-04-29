WITH filtered_kt AS
  (SELECT id
   FROM kind_type
   WHERE kind IN ('tv movie',
                   'tv series',
                   'video game')),
     filtered_k AS
  (SELECT id
   FROM keyword
   WHERE keyword IN ('anal-sex',
                     'bare-chested-male',
                     'dog',
                     'female-nudity',
                     'flashback',
                     'friendship',
                     'hardcore',
                     'husband-wife-relationship',
                     'jealousy',
                     'lesbian-sex',
                     'male-frontal-nudity',
                     'mother-son-relationship',
                     'murder',
                     'non-fiction',
                     'oral-sex',
                     'sex',
                     'surrealism',
                     'violence')),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('costume designer')),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     OR gender IS NULL)
SELECT COUNT(*)
FROM title AS t
JOIN filtered_kt ON t.kind_id = filtered_kt.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN filtered_k ON mk.keyword_id = filtered_k.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_rt ON ci.role_id = filtered_rt.id
JOIN filtered_n ON ci.person_id = filtered_n.id
WHERE t.production_year BETWEEN 1950 AND 2010
  AND mi1.info_type_id IN ('7')
  AND mi1.info IN ('CAM:Arriflex Cameras and Lenses',
                    'CAM:Red One Camera',
                    'LAB:DuArt Film Laboratories Inc., New York, USA',
                    'LAB:Technicolor, Hollywood (CA), USA',
                    'LAB:Technicolor, USA',
                    'PFM:70 mm',
                    'PFM:Digital',
                    'RAT:1.66 : 1')
  AND mi2.info_type_id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color');