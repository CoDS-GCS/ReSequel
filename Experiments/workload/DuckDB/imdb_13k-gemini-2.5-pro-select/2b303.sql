
SELECT COUNT(*)
FROM
  (SELECT mk.movie_id
   FROM keyword AS k
   JOIN movie_keyword AS mk ON k.id = mk.keyword_id
   WHERE k.keyword IN ('bare-breasts',
                     'bare-chested-male',
                     'dancing',
                     'father-son-relationship',
                     'female-frontal-nudity',
                     'flashback',
                     'hospital',
                     'jealousy',
                     'kidnapping',
                     'lesbian-sex',
                     'male-frontal-nudity',
                     'male-nudity',
                     'non-fiction',
                     'party',
                     'surrealism')) AS filtered_mk
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
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND it1.id IN ('7')
  AND mi1.info IN ('OFM:16 mm',
                    'OFM:Video',
                    'PCS:Digital Intermediate',
                    'PCS:Spherical',
                    'PFM:70 mm',
                    'RAT:1.66 : 1',
                    'RAT:2.35 : 1')
  AND it2.id IN ('8')
  AND mi2.info IN ('Germany',
                    'India',
                    'Italy',
                    'Japan',
                    'UK',
                    'USA',
                    'West Germany')
  AND rt.role IN ('actress',
                   'costume designer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);