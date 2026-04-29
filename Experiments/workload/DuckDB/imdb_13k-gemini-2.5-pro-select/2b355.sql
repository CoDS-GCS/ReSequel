
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE n.gender IS NULL
  AND rt.role IN ('writer')
  AND t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('movie',
                   'video movie')
  AND it1.id IN ('1')
  AND mi1.info IN ('102',
                    '110',
                    '23',
                    '30',
                    '42',
                    '43',
                    '60',
                    '85',
                    '88',
                    '90',
                    '95',
                    '97',
                    '99')
  AND it2.id IN ('7')
  AND mi2.info IN ('OFM:35 mm',
                    'PCS:Spherical',
                    'PFM:35 mm',
                    'RAT:1.33 : 1',
                    'RAT:1.78 : 1',
                    'RAT:1.85 : 1',
                    'RAT:16:9 HD')
  AND k.keyword IN ('boccie-bowling',
                     'bridge',
                     'checker-game',
                     'cinderella-story',
                     'comic-strip',
                     'death-star',
                     'dread',
                     'flip-flop-sex',
                     'foreign-occupation',
                     'hit-with-a-bedpan',
                     'honorable-death',
                     'import-models',
                     'lezghin-girl',
                     'michael-moore',
                     'padre',
                     'protective-gear',
                     'rower',
                     'stepson-stepmother-relationship',
                     'telpher-carrier',
                     'thrown-down-a-mountainside',
                     'uniform-code-of-military-justice',
                     'wooden-coat-hanger',
                     'world-of-magic');