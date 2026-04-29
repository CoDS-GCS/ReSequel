
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
WHERE pi.info ILIKE '%1943%'
  AND it2.id IN ('23')
  AND rt.role IN ('costume designer',
                   'director',
                   'guest',
                   'producer',
                   'production designer',
                   'writer')
  AND t.production_year BETWEEN 1875 AND 2015
  AND kt.kind IN ('episode',
                   'tv mini series',
                   'tv movie',
                   'video game')
  AND mi1.info ILIKE '%eng%'
  AND it1.id IN ('4')
GROUP BY n.gender,
         rt.role,
         cn.name
ORDER BY COUNT(*) DESC;