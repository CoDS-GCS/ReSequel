
SELECT COUNT(*)
FROM title AS t,
     kind_type AS kt,
     info_type AS it1,
     movie_info AS mi1,
     movie_info AS mi2,
     info_type AS it2,
     cast_info AS ci,
     role_type AS rt,
     name AS n
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND mi1.info_type_id = it1.id
  AND mi2.info_type_id = it2.id
  AND it1.id IN ('4')
  AND it2.id IN ('7')
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND mi1.info IN ('Czech',
                    'Georgian',
                    'Hebrew',
                    'Italian',
                    'Latin',
                    'Serbo-Croatian',
                    'Spanish',
                    'Swedish')
  AND mi2.info IN ('LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'LAB:Technicolor',
                    'MET:600 m',
                    'OFM:16 mm',
                    'PCS:CinemaScope',
                    'PCS:Kinescope',
                    'PCS:Panavision',
                    'PCS:Spherical',
                    'PFM:16 mm',
                    'PFM:70 mm',
                    'PFM:Video',
                    'RAT:1.33 : 1',
                    'RAT:1.37 : 1',
                    'RAT:1.66 : 1')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND rt.role IN ('actor',
                   'miscellaneous crew')
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND t.production_year BETWEEN 1925 AND 1975;