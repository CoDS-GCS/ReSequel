
SELECT COUNT(*)
FROM title AS t
WHERE t.production_year BETWEEN 1875 AND 1975
  AND EXISTS
    (SELECT 1
     FROM kind_type AS kt
     WHERE kt.id = t.kind_id
       AND kt.kind IN ('tv series',
                   'video game',
                   'video movie'))
  AND EXISTS
    (SELECT 1
     FROM movie_keyword AS mk
     JOIN keyword AS k ON k.id = mk.keyword_id
     WHERE mk.movie_id = t.id
       AND k.keyword IN ('bare-breasts',
                     'friendship',
                     'lesbian',
                     'police',
                     'surrealism'))
  AND EXISTS
    (SELECT 1
     FROM cast_info AS ci
     JOIN name AS n ON n.id = ci.person_id
     JOIN role_type AS rt ON rt.id = ci.role_id
     WHERE ci.movie_id = t.id
       AND n.gender IN ('f')
       AND rt.role IN ('director'))
  AND EXISTS
    (SELECT 1
     FROM movie_info AS mi1
     WHERE mi1.movie_id = t.id
       AND mi1.info_type_id IN ('3')
       AND mi1.info IN ('Drama',
                    'Short',
                    'Western'))
  AND EXISTS
    (SELECT 1
     FROM movie_info AS mi2
     WHERE mi2.movie_id = t.id
       AND mi2.info_type_id IN ('18')
       AND mi2.info IN ('Iverson Ranch - 1 Iverson Lane, Chatsworth, Los Angeles, California, USA',
                    'Mexico',
                    'New York City, New York, USA'));