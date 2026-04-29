
SELECT n.name,
       mi1.info,
       MIN(t.production_year),
       MAX(t.production_year)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN title AS t ON ci.movie_id = t.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
WHERE n.name ILIKE '%san%'
  AND mi1.info IN ('Black and White')
  AND EXISTS
    (SELECT 1
     FROM kind_type kt
     WHERE kt.id = t.kind_id
       AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game'))
  AND EXISTS
    (SELECT 1
     FROM role_type rt
     WHERE rt.id = ci.role_id
       AND rt.role IN ('cinematographer',
                   'composer',
                   'writer'))
  AND EXISTS
    (SELECT 1
     FROM info_type it1
     WHERE it1.id = mi1.info_type_id
       AND it1.id IN ('2'))
GROUP BY n.name,
         mi1.info;