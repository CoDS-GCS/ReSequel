
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
                   'tv series'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'actress',
                   'editor',
                   'guest',
                   'miscellaneous crew',
                   'production designer',
                   'writer'))
  AND pi.info_type_id IN ('20')
  AND mi1.info_type_id IN ('108')
  AND pi.info ILIKE '%us%'
  AND mi1.info ILIKE '%2000%'
GROUP BY mi1.info,
         pi.info;