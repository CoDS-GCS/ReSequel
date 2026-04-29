
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1950 AND 1990
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv series',
                   'video game',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('director'))
  AND mi1.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('2'))
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('5'))
  AND mi2.info IN ('Argentina:16',
                    'Spain:18',
                    'Spain:T',
                    'Sweden:Btl');