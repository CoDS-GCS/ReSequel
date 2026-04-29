
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
                   'tv mini series',
                   'tv movie',
                   'tv series',
                   'video game'))
  AND rt.role IN ('actor',
                   'actress',
                   'cinematographer',
                   'costume designer',
                   'director',
                   'guest',
                   'producer',
                   'production designer')
  AND mi1.info_type_id IN ('90')
  AND pi.info_type_id IN ('24')
  AND mi1.info ILIKE '%mo%'
  AND pi.info ILIKE '%k%'
GROUP BY mi1.info,
         pi.info;