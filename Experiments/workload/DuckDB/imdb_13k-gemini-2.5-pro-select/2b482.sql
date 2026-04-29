
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
  AND mi1.info_type_id = it1.id
  AND mi2.info_type_id = it2.id
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND it1.id IN ('1')
  AND it2.id IN ('7')
  AND mi1.info IN ('101',
                    '102',
                    '107',
                    '60',
                    '7',
                    '75',
                    '82',
                    '83',
                    '90',
                    '99',
                    'Argentina:30')
  AND mi2.info IN ('LAB:DeLuxe',
                    'OFM:35 mm',
                    'PCS:Spherical',
                    'PFM:35 mm',
                    'PFM:Video',
                    'RAT:1.33 : 1')
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND rt.role IN ('composer',
                   'miscellaneous crew')
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND t.production_year BETWEEN 1950 AND 2010
  AND k.keyword IN ('blood',
                     'death',
                     'dog',
                     'family-relationships',
                     'father-daughter-relationship',
                     'female-nudity',
                     'flashback',
                     'hardcore',
                     'homosexual',
                     'hospital',
                     'lesbian-sex',
                     'love',
                     'male-frontal-nudity',
                     'mother-son-relationship',
                     'nudity',
                     'one-word-title',
                     'sequel',
                     'singing',
                     'surrealism');