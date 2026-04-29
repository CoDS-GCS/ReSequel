
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
                   'tv series',
                   'video movie'))
  AND rt.role IN ('actor',
                   'actress',
                   'composer',
                   'costume designer',
                   'director',
                   'guest',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND mi1.info_type_id IN ('103')
  AND pi.info_type_id IN ('37')
  AND mi1.info ILIKE '%198%'
  AND pi.info ILIKE '%arg%'
GROUP BY mi1.info,
         pi.info;