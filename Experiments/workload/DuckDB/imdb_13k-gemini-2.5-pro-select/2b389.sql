
SELECT COUNT(*)
FROM
  (SELECT mk.movie_id
   FROM keyword AS k
   JOIN movie_keyword AS mk ON k.id = mk.keyword_id
   WHERE k.keyword IN ('based-on-play',
                     'doctor',
                     'hardcore',
                     'jealousy',
                     'new-york-city',
                     'one-word-title')) AS filtered_mk
JOIN title AS t ON filtered_mk.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
  AND it1.id IN ('7')
  AND mi1.info IN ('LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'MET:',
                    'MET:100 m',
                    'MET:15.2 m',
                    'MET:1500 m',
                    'MET:23 m',
                    'MET:30 m',
                    'MET:300 m',
                    'PCS:Panavision',
                    'PCS:Techniscope',
                    'PFM:16 mm',
                    'PFM:68 mm',
                    'RAT:1.36 : 1',
                    'RAT:1.37 : 1')
  AND it2.id IN ('6')
  AND mi2.info IN ('Mono',
                    'Silent')
  AND rt.role IN ('director',
                   'producer')
  AND (n.gender IN ('f')
       OR n.gender IS NULL);