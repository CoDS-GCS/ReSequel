
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
                   'tv movie',
                   'tv series',
                   'video game'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('composer',
                   'director',
                   'editor',
                   'guest',
                   'miscellaneous crew',
                   'producer'))
  AND pi.info_type_id IN ('21')
  AND mi1.info_type_id IN ('90')
  AND pi.info ILIKE '%185%'
  AND mi1.info ILIKE '%192%'
GROUP BY mi1.info,
         pi.info;