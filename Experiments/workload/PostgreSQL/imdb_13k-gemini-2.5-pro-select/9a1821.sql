
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
                   'tv series')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'composer',
                   'costume designer',
                   'editor',
                   'producer',
                   'production designer'))
  AND mi1.info_type_id IN ('94')
  AND pi.info_type_id IN ('37')
  AND mi1.info ILIKE '%au%'
  AND pi.info ILIKE '%ch%'
GROUP BY mi1.info,
         pi.info;