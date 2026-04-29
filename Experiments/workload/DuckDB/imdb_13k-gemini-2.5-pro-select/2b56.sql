
SELECT COUNT(*)
FROM title AS t,
     kind_type AS kt,
     info_type AS it1,
     movie_info AS mi1,
     movie_info AS mi2,
     info_type AS it2,
     cast_info AS ci,
     role_type AS rt,
     name AS n,
     movie_keyword AS mk,
     keyword AS k
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.id = mk.movie_id
  AND k.id = mk.keyword_id
  AND mi1.movie_id = mi2.movie_id
  AND mi1.info_type_id = it1.id
  AND mi2.info_type_id = it2.id
  AND it1.id IN ('7')
  AND it2.id IN ('2')
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND mi1.info IN ('CAM:Arriflex Cameras',
                    'CAM:Red One Camera',
                    'LAB:Technicolor',
                    'OFM:16 mm',
                    'OFM:Video',
                    'PCS:Super 35',
                    'PFM:35 mm',
                    'PFM:D-Cinema',
                    'RAT:1.33 : 1',
                    'RAT:1.78 : 1')
  AND mi2.info IN ('Black and White',
                    'Color')
  AND kt.kind IN ('tv series',
                   'video game')
  AND rt.role IN ('actor')
  AND n.gender IN ('m')
  AND t.production_year BETWEEN 1975 AND 2015
  AND k.keyword IN ('character-name-in-title',
                     'doctor',
                     'family-relationships',
                     'female-nudity',
                     'fight',
                     'flashback',
                     'friendship',
                     'gay',
                     'independent-film',
                     'interview',
                     'jealousy',
                     'lesbian-sex',
                     'male-frontal-nudity',
                     'new-york-city',
                     'nudity',
                     'oral-sex',
                     'singing',
                     'tv-mini-series');