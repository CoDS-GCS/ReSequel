
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
WHERE pi.info_type_id IN ('23')
  AND pi.info ILIKE '%20%'
  AND rt.role IN ('actor',
                   'composer',
                   'costume designer',
                   'director',
                   'editor',
                   'guest',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND mi1.info_type_id IN ('16')
  AND mi1.info ILIKE '%emi%'
  AND kt.kind IN ('episode',
                   'tv mini series',
                   'tv movie',
                   'video game',
                   'video movie')
GROUP BY mi1.info,
         pi.info;