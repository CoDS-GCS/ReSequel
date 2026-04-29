
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'composer',
                   'costume designer',
                   'miscellaneous crew'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('7')
  AND mi1.info IN ('CAM:Panavision Cameras and Lenses',
                    'CAM:Sony HDW-F900',
                    'LAB:Technicolor, Hollywood (CA), USA',
                    'OFM:16 mm',
                    'PCS:Redcode RAW',
                    'PCS:Spherical',
                    'PFM:35 mm',
                    'PFM:Video',
                    'RAT:1.78 : 1 / (anamorphic)',
                    'RAT:1.78 : 1 / (high definition)',
                    'RAT:1.78 : 1 / (letterbox)',
                    'RAT:1.78 : 1',
                    'RAT:4:3 Letterbox')
  AND mi2.info_type_id IN ('105')
  AND mi2.info IN ('$1,000',
                    '$2,000',
                    '$20,000,000',
                    '$300,000',
                    '$45,000,000',
                    '$60,000,000');