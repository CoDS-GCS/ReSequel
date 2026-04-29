WITH filtered_cast_info AS
  (SELECT ci.movie_id,
          ci.person_id
   FROM cast_info AS ci
   WHERE ci.role_id IN
       (SELECT id
        FROM role_type
        WHERE ROLE IN ('actor',
                   'cinematographer',
                   'composer',
                   'costume designer',
                   'editor',
                   'guest',
                   'miscellaneous crew')))
SELECT mi1.info,
       pi.info,
       COUNT(*)
FROM movie_info AS mi1
JOIN filtered_cast_info AS fci ON mi1.movie_id = fci.movie_id
JOIN person_info AS pi ON fci.person_id = pi.person_id
WHERE mi1.info_type_id IN ('104')
  AND pi.info_type_id IN ('20')
  AND mi1.info ILIKE '%199%'
  AND pi.info ILIKE '%un%'
  AND EXISTS
    (SELECT 1
     FROM title AS t
     WHERE t.id = fci.movie_id
       AND t.kind_id IN
         (SELECT id
          FROM kind_type
          WHERE kind IN ('episode',
                   'movie',
                   'tv mini series',
                   'tv movie',
                   'tv series',
                   'video movie')))
GROUP BY mi1.info,
         pi.info;