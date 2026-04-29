
SELECT mi1.info,
       pi.info,
       COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
WHERE kt.kind IN ('episode',
                   'movie',
                   'tv mini series',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'actress',
                   'composer',
                   'costume designer',
                   'editor',
                   'guest',
                   'miscellaneous crew',
                   'production designer',
                   'writer'))
  AND mi1.info_type_id IN ('104')
  AND pi.info_type_id IN ('39')
  AND mi1.info ILIKE '%19%'
  AND pi.info ILIKE '%ca%'
GROUP BY mi1.info,
         pi.info;