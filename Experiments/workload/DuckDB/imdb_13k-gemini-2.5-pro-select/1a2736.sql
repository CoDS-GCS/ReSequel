
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
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('movie',
                   'video movie')
  AND it1.id IN ('1')
  AND mi1.info IN ('142',
                    '19',
                    '2',
                    '46',
                    '47',
                    '51',
                    '88',
                    'Germany:97',
                    'USA:110',
                    'USA:118',
                    'USA:80',
                    'USA:81',
                    'USA:88')
  AND it2.id IN ('7')
  AND mi2.info IN ('CAM:Canon 7D',
                    'LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'LAB:Laboratoires Éclair, Paris, France',
                    'OFM:Super 16',
                    'PCS:Panavision',
                    'PCS:Redcode RAW',
                    'PCS:Super 16',
                    'PFM:Video',
                    'RAT:2.20 : 1')
  AND rt.role IN ('costume designer',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND (n.gender IN ('f')
       OR n.gender IS NULL);