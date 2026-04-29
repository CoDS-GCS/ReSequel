
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
WHERE kt.kind IN ('episode',
                   'movie',
                   'tv mini series',
                   'tv series',
                   'video game')
  AND rt.role IN ('actor',
                   'director',
                   'editor',
                   'guest',
                   'miscellaneous crew',
                   'producer')
  AND mi1.info_type_id IN ('108')
  AND pi.info_type_id IN ('21')
  AND mi1.info ILIKE '%2,%'
  AND pi.info ILIKE '%fe%'
GROUP BY mi1.info,
         pi.info;