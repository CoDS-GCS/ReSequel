
SELECT n.gender,
       rt.role,
       cn.name,
       COUNT(*)
FROM info_type AS it2
JOIN person_info AS pi ON it2.id = pi.info_type_id
JOIN name AS n ON pi.person_id = n.id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
WHERE pi.info ILIKE '%bo%'
  AND it2.id IN ('37')
  AND rt.role IN ('costume designer',
                   'director',
                   'guest',
                   'miscellaneous crew',
                   'producer')
  AND t.production_year BETWEEN 1875 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'tv mini series',
                   'tv movie',
                   'tv series')
  AND mi1.info ILIKE '%co%'
  AND it1.id IN ('2')
GROUP BY n.gender,
         rt.role,
         cn.name
ORDER BY COUNT(*) DESC;