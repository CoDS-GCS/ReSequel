 
 
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1925 AND 1975
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'costume designer',
                   'director'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('5')
  AND mi1.info IN ('Argentina:18',
                    'Brazil:12',
                    'Canada:R',
                    'Finland:K-15',
                    'France:-16',
                    'Germany:12',
                    'India:U',
                    'Portugal:17',
                    'USA:PG-13')
  AND mi2.info_type_id IN ('7')
  AND mi2.info IN ('CAM:Bausch & Lomb Lenses',
                    'LAB:Technicolor, USA',
                    'OFM:35 mm',
                    'PCS:Spherical',
                    'PCS:VistaVision',
                    'RAT:1.37 : 1',
                    'RAT:1.75 : 1');