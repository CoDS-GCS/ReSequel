 
 
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('video game',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress'))
  AND mi1.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('8'))
  AND mi1.info IN ('France',
                    'Germany',
                    'Italy',
                    'Japan',
                    'Portugal',
                    'Spain',
                    'UK',
                    'USA',
                    'West Germany')
  AND mi2.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('7'))
  AND mi2.info IN ('OFM:35 mm',
                    'PCS:Spherical',
                    'PFM:16 mm',
                    'PFM:35 mm',
                    'RAT:1.33 : 1');