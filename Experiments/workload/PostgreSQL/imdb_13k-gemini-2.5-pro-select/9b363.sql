
SELECT mi1.info,
       n.name,
       COUNT(*)
FROM name AS n
JOIN person_info AS pi ON n.id = pi.person_id
JOIN info_type AS it2 ON pi.info_type_id = it2.id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
WHERE n.name ILIKE '%dani%'
  AND t.production_year BETWEEN 1875 AND 1975
  AND it2.id IN ('22')
  AND rt.role IN ('actress',
                   'costume designer',
                   'director',
                   'miscellaneous crew')
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND it1.id IN ('2',
                  '6')
  AND mi1.info IN ('Black and White',
                    'Mono')
GROUP BY mi1.info,
         n.name;