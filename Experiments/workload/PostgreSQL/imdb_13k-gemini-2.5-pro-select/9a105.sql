
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
     WHERE kind IN ('tv mini series',
                   'tv series',
                   'video game'))
  AND rt.role IN ('actress',
                   'cinematographer',
                   'composer',
                   'editor',
                   'guest',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
  AND mi1.info_type_id IN ('94')
  AND pi.info_type_id IN ('21')
  AND mi1.info ILIKE '%is%'
  AND pi.info ILIKE '%14%'
GROUP BY mi1.info,
         pi.info;