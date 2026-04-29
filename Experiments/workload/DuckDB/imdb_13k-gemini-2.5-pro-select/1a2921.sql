
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'costume designer',
                   'guest',
                   'producer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('7')
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
  AND mi2.info_type_id IN ('5')
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
                    'West Germany:6');