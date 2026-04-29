
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
  AND mi1.info IN ('Crime',
                    'Drama')
  AND mi2.info IN ('France',
                    'USA')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('movie',
                   'tv movie'))
  AND mi1.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('3'))
  AND mi2.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('8'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('director'));