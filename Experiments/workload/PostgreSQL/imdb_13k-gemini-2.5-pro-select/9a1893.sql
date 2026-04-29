
SELECT mi1.info,
       pi.info,
       COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
WHERE mi1.info_type_id IN ('16')
  AND pi.info_type_id IN ('21')
  AND mi1.info ILIKE '%au%'
  AND pi.info ILIKE '%19%'
  AND kt.kind IN ('episode',
                   'movie',
                   'tv mini series',
                   'tv series',
                   'video game')
  AND rt.role IN ('actor',
                   'composer',
                   'costume designer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'writer')
GROUP BY mi1.info,
         pi.info;