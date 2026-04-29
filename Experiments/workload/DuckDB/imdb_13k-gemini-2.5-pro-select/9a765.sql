
SELECT mi1.info,
       pi.info,
       COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
JOIN info_type AS it2 ON pi.info_type_id = it2.id
WHERE it1.id IN ('16')
  AND it2.id IN ('23')
  AND mi1.info ILIKE '%kaz%'
  AND pi.info ILIKE '%197%'
  AND kt.kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video game')
  AND rt.role IN ('actor',
                   'actress',
                   'composer',
                   'costume designer',
                   'director',
                   'editor',
                   'guest',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
GROUP BY mi1.info,
         pi.info;