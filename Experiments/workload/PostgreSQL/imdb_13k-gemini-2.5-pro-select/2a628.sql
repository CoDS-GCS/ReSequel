 
 
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND n.gender IS NULL
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info IN ('LAB:Technicolor, USA',
                    'MET:200 m',
                    'MET:23 m',
                    'MET:900 m',
                    'OFM:16 mm',
                    'PCS:CinemaScope',
                    'PCS:Kinescope',
                    'PCS:Panavision',
                    'PFM:68 mm',
                    'RAT:1.36 : 1',
                    'RAT:1.66 : 1',
                    'RAT:1.85 : 1',
                    'RAT:2.35 : 1')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv series',
                   'video game',
                   'video movie'))
  AND mi1.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('2'))
  AND mi2.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('7'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('production designer'));