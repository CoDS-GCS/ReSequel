
SELECT mi1.info,
       pi.info,
       COUNT(*)
FROM cast_info AS ci
JOIN movie_info AS mi1 ON ci.movie_id = mi1.movie_id
JOIN person_info AS pi ON ci.person_id = pi.person_id
WHERE mi1.info_type_id IN ('90')
  AND pi.info_type_id IN ('29')
  AND mi1.info ILIKE '%wa%'
  AND pi.info ILIKE '%ga%'
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'actress',
                   'cinematographer',
                   'composer',
                   'costume designer',
                   'director',
                   'editor',
                   'guest',
                   'miscellaneous crew'))
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
                   'tv series',
                   'video game',
                   'video movie')))
GROUP BY mi1.info,
         pi.info;