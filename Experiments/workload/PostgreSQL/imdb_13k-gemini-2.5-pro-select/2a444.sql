 
 
SELECT COUNT(*)
FROM title AS t
WHERE t.production_year BETWEEN 1875 AND 1975
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv series',
                   'video game',
                   'video movie'))
  AND EXISTS
    (SELECT 1
     FROM movie_info AS mi1
     JOIN info_type AS it1 ON mi1.info_type_id = it1.id
     WHERE mi1.movie_id = t.id
       AND it1.id IN ('4')
       AND mi1.info IN ('Czech',
                    'Danish',
                    'Dutch',
                    'Japanese',
                    'Mandarin',
                    'Portuguese',
                    'Romanian',
                    'Russian',
                    'Swedish'))
  AND EXISTS
    (SELECT 1
     FROM movie_info AS mi2
     JOIN info_type AS it2 ON mi2.info_type_id = it2.id
     WHERE mi2.movie_id = t.id
       AND it2.id IN ('6')
       AND mi2.info IN ('Mono',
                    'Silent'))
  AND EXISTS
    (SELECT 1
     FROM cast_info AS ci
     JOIN name AS n ON ci.person_id = n.id
     JOIN role_type AS rt ON ci.role_id = rt.id
     WHERE ci.movie_id = t.id
       AND n.gender IN ('f')
       AND rt.role IN ('producer'))
  AND EXISTS
    (SELECT 1
     FROM movie_keyword AS mk
     WHERE mk.movie_id = t.id);