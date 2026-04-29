
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
WHERE t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video movie')
  AND it1.id IN ('7')
  AND mi1.info IN ('CAM:Panavision Cameras and Lenses',
                    'LAB:Laboratoires LTC, St. Cloud, France',
                    'LAB:Pathé Laboratory, USA',
                    'LAB:Rank Film Laboratories, Denham, UK',
                    'LAB:Technicolor S.p.a., Roma, Italy',
                    'LAB:Technicolor, Hollywood (CA), USA',
                    'MET:300 m',
                    'OFM:65 mm',
                    'PFM:16 mm',
                    'PFM:Video',
                    'RAT:1.66 : 1',
                    'RAT:1.78 : 1')
  AND it2.id IN ('5')
  AND mi2.info IN ('Argentina:13',
                    'Argentina:18',
                    'Australia:PG',
                    'Australia:R',
                    'Canada:G',
                    'Finland:K-15',
                    'Italy:VM14',
                    'Italy:VM18',
                    'Norway:16',
                    'Portugal:M/6',
                    'UK:18',
                    'West Germany:6')
  AND rt.role IN ('actor',
                   'costume designer',
                   'guest',
                   'producer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);