
SELECT mi1.info,
       pi.info,
       COUNT(*)
FROM cast_info AS ci
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
JOIN title AS t ON ci.movie_id = t.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
WHERE t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv mini series',
                   'tv movie',
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('cinematographer',
                   'editor',
                   'miscellaneous crew',
                   'production designer',
                   'writer'))
  AND pi.info_type_id IN ('21')
  AND mi1.info_type_id IN ('106')
  AND pi.info ILIKE '%1993%'
  AND mi1.info ILIKE '%20%'
GROUP BY mi1.info,
         pi.info;