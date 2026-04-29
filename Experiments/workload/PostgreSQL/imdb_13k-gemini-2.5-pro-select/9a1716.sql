
SELECT mi1.info,
       pi.info,
       COUNT(*)
FROM cast_info AS ci
JOIN movie_info AS mi1 ON ci.movie_id = mi1.movie_id
JOIN person_info AS pi ON ci.person_id = pi.person_id
WHERE mi1.info_type_id IN ('108')
  AND pi.info_type_id IN ('38')
  AND mi1.info ILIKE '%30%'
  AND pi.info ILIKE '%mar%'
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'actress',
                   'composer',
                   'costume designer',
                   'guest',
                   'producer',
                   'production designer',
                   'writer'))
  AND EXISTS
    (SELECT 1
     FROM title AS t
     WHERE t.id = ci.movie_id
       AND t.kind_id IN
         (SELECT id
          FROM kind_type
          WHERE kind IN ('episode',
                   'movie',
                   'tv mini series',
                   'tv movie',
                   'tv series')))
GROUP BY mi1.info,
         pi.info;