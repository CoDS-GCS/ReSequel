
SELECT mi1.info,
       pi.info,
       COUNT(*)
FROM cast_info AS ci
JOIN movie_info AS mi1 ON ci.movie_id = mi1.movie_id
JOIN person_info AS pi ON ci.person_id = pi.person_id
WHERE mi1.info_type_id IN ('110')
  AND pi.info_type_id IN ('39')
  AND mi1.info ILIKE '%15%'
  AND pi.info ILIKE '%pa%'
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'composer',
                   'costume designer',
                   'director',
                   'editor',
                   'guest',
                   'miscellaneous crew',
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
                   'tv series',
                   'video game',
                   'video movie')))
GROUP BY mi1.info,
         pi.info;