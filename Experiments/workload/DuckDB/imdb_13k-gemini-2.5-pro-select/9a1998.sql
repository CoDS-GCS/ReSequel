
SELECT mi1.info,
       pi.info,
       COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
WHERE mi1.info_type_id IN ('107')
  AND pi.info_type_id IN ('24')
  AND mi1.info ILIKE '%1,0%'
  AND pi.info ILIKE '%m%'
  AND kt.kind IN ('tv mini series',
                   'tv movie',
                   'tv series',
                   'video game')
  AND rt.role IN ('actress',
                   'cinematographer',
                   'costume designer',
                   'director',
                   'editor',
                   'guest',
                   'miscellaneous crew',
                   'production designer')
GROUP BY mi1.info,
         pi.info;