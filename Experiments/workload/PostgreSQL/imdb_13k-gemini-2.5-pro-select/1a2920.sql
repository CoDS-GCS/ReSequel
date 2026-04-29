
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'composer',
                   'producer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('7')
  AND mi1.info IN ('CAM:Bausch & Lomb Lenses',
                    'CAM:Panavision Cameras and Lenses',
                    'CAM:Panavision Lenses',
                    'LAB:DeLuxe, USA',
                    'LAB:Laboratoires Éclair, Paris, France',
                    'LAB:Universal Studios Laboratory, USA',
                    'MET:135 m',
                    'OFM:35 mm',
                    'PCS:Shawscope',
                    'PCS:Ultrascope',
                    'RAT:1.37 : 1',
                    'RAT:2.00 : 1')
  AND mi2.info_type_id IN ('16')
  AND mi2.info IN ('France:1911',
                    'France:1912',
                    'France:1913',
                    'USA:1903',
                    'USA:1904',
                    'USA:1955',
                    'USA:1960',
                    'USA:July 1901',
                    'USA:May 1902');