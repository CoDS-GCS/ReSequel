
SELECT mi1.info,
       pi.info,
       COUNT(*)
FROM kind_type AS kt
INNER JOIN title AS t ON kt.id = t.kind_id
INNER JOIN movie_info AS mi1 ON t.id = mi1.movie_id
INNER JOIN cast_info AS ci ON t.id = ci.movie_id
INNER JOIN role_type AS rt ON ci.role_id = rt.id
INNER JOIN name AS n ON ci.person_id = n.id
INNER JOIN person_info AS pi ON n.id = pi.person_id
WHERE kt.kind IN ('movie',
                   'tv mini series',
                   'tv series',
                   'video movie')
  AND rt.role IN ('cinematographer',
                   'editor',
                   'guest',
                   'miscellaneous crew',
                   'production designer')
  AND mi1.info_type_id IN ('16')
  AND pi.info_type_id IN ('23')
  AND mi1.info ILIKE '%au%'
  AND pi.info ILIKE '%1974%'
GROUP BY mi1.info,
         pi.info;