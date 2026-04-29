
SELECT COUNT(*)
FROM
  (SELECT mk.movie_id
   FROM keyword AS k
   JOIN movie_keyword AS mk ON k.id = mk.keyword_id
   WHERE k.keyword IN ('blood',
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
WHERE t.production_year BETWEEN 1950 AND 2010
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND it1.id IN ('1')
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
  AND it2.id IN ('7')
  AND mi2.info IN ('LAB:DeLuxe',
                    'OFM:35 mm',
                    'PCS:Spherical',
                    'PFM:35 mm',
                    'PFM:Video',
                    'RAT:1.33 : 1')
  AND rt.role IN ('composer',
                   'miscellaneous crew')
  AND (n.gender IN ('f')
       OR n.gender IS NULL);