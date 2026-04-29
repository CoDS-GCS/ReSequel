
SELECT mi1.info,
       pi.info,
       COUNT(*)
FROM person_info AS pi
INNER JOIN name AS n ON n.id = pi.person_id
INNER JOIN cast_info AS ci ON ci.person_id = n.id
INNER JOIN role_type AS rt ON ci.role_id = rt.id
INNER JOIN movie_info AS mi1 ON ci.movie_id = mi1.movie_id
INNER JOIN title AS t ON mi1.movie_id = t.id
INNER JOIN kind_type AS kt ON t.kind_id = kt.id
WHERE pi.info_type_id IN ('21')
  AND pi.info ILIKE '%26%'
  AND rt.role IN ('actor',
                   'actress',
                   'cinematographer',
                   'composer',
                   'costume designer',
                   'director',
                   'editor',
                   'guest',
                   'miscellaneous crew',
                   'production designer')
  AND mi1.info_type_id IN ('18')
  AND mi1.info ILIKE '%las%'
  AND kt.kind IN ('episode',
                   'tv mini series',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
GROUP BY mi1.info,
         pi.info;