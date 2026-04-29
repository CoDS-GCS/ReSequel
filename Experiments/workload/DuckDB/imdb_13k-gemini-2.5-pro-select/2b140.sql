
SELECT COUNT(*)
FROM
  (SELECT mk.movie_id
   FROM keyword AS k
   JOIN movie_keyword AS mk ON k.id = mk.keyword_id
   WHERE k.keyword IN ('based-on-play',
                     'dancing',
                     'number-in-title',
                     'sex',
                     'suicide')) AS filtered_mk
JOIN title AS t ON filtered_mk.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND it1.id IN ('6')
  AND mi1.info IN ('70 mm 6-Track',
                    'DTS',
                    'Dolby Digital',
                    'Dolby',
                    'Mono',
                    'SDDS')
  AND it2.id IN ('7')
  AND mi2.info IN ('CAM:Panavision Cameras and Lenses',
                    'LAB:DeLuxe, Hollywood (CA), USA',
                    'MET:300 m',
                    'PCS:CinemaScope',
                    'PCS:Shawscope',
                    'PCS:Techniscope',
                    'PFM:70 mm',
                    'PFM:D-Cinema',
                    'PFM:Digital',
                    'RAT:16:9 HD',
                    'RAT:2.35 : 1')
  AND rt.role IN ('editor',
                   'miscellaneous crew')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);