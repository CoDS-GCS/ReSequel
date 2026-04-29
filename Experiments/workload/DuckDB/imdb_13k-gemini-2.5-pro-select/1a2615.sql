
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
                   'tv movie',
                   'tv series',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('costume designer',
                   'editor',
                   'producer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('5')
  AND mi1.info IN ('Brazil:14',
                    'Finland:S',
                    'France:-16',
                    'Germany:6',
                    'Iceland:L',
                    'Japan:G',
                    'Netherlands:6',
                    'New Zealand:PG',
                    'Norway:A',
                    'Peru:14',
                    'USA:G',
                    'USA:Not Rated')
  AND mi2.info_type_id IN ('7')
  AND mi2.info IN ('CAM:Bausch & Lomb Lenses',
                    'CAM:Panavision Cameras and Lenses',
                    'LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'LAB:Rank Film Laboratories, Denham, UK',
                    'PCS:VistaVision',
                    'RAT:1.85 : 1',
                    'RAT:2.20 : 1');