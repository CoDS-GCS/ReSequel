
SELECT COUNT(*)
FROM title AS t,
     movie_info AS mi1,
     movie_info AS mi2,
     cast_info AS ci,
     movie_keyword AS mk
WHERE t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.id = ci.movie_id
  AND t.id = mk.movie_id
  AND t.production_year BETWEEN 1925 AND 2015
  AND mi1.info IN ('70 mm 6-Track',
                    'DTS',
                    'Dolby Digital',
                    'Dolby',
                    'Mono',
                    'SDDS')
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
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'video movie'))
  AND mi1.info_type_id IN ('6')
  AND mi2.info_type_id IN ('7')
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('based-on-play',
                     'dancing',
                     'number-in-title',
                     'sex',
                     'suicide'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('editor',
                   'miscellaneous crew'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL);