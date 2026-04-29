
SELECT mi1.info,
       pi.info,
       COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
WHERE t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv mini series',
                   'tv movie',
                   'tv series',
                   'video movie'))
  AND rt.role IN ('composer',
                   'miscellaneous crew',
                   'production designer',
                   'writer')
  AND mi1.info_type_id IN ('16')
  AND pi.info_type_id IN ('29')
  AND mi1.info ILIKE '%fi%'
  AND pi.info ILIKE '%sp%'
GROUP BY mi1.info,
         pi.info;