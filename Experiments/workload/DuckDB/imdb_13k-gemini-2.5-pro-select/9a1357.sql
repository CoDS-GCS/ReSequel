
SELECT mi1.info,
       pi.info,
       COUNT(*)
FROM title AS t
INNER JOIN kind_type AS kt ON t.kind_id = kt.id
INNER JOIN movie_info AS mi1 ON t.id = mi1.movie_id
INNER JOIN info_type AS it1 ON mi1.info_type_id = it1.id
INNER JOIN cast_info AS ci ON t.id = ci.movie_id
INNER JOIN role_type AS rt ON ci.role_id = rt.id
INNER JOIN name AS n ON ci.person_id = n.id
INNER JOIN person_info AS pi ON n.id = pi.person_id
INNER JOIN info_type AS it2 ON pi.info_type_id = it2.id
WHERE it1.id IN ('90')
  AND it2.id IN ('38')
  AND mi1.info ILIKE '%%'
  AND pi.info ILIKE '%bod%'
  AND kt.kind IN ('episode',
                   'movie',
                   'tv mini series',
                   'tv series',
                   'video game')
  AND rt.role IN ('actor',
                   'cinematographer',
                   'costume designer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
GROUP BY mi1.info,
         pi.info;