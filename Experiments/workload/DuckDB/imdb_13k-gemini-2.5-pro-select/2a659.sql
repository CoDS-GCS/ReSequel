
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
  AND mi1.info IN ('MET:',
                    'MET:1500 m',
                    'MET:600 m',
                    'PFM:16 mm',
                    'PFM:35 mm',
                    'PFM:68 mm',
                    'RAT:1.33 : 1',
                    'RAT:1.37 : 1',
                    'RAT:2.35 : 1')
  AND mi2.info IN ('Documentary',
                    'Drama',
                    'Music',
                    'Romance',
                    'Short',
                    'Sport',
                    'War',
                    'Western')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv series',
                   'video game',
                   'video movie'))
  AND mi1.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('7'))
  AND mi2.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('3'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('composer'));