WITH person_candidates AS
  (SELECT n.id,
          n.gender
   FROM name AS n
   JOIN person_info AS pi ON n.id = pi.person_id
   JOIN info_type AS it2 ON pi.info_type_id = it2.id
   WHERE pi.info ILIKE '%0-%'
     AND it2.id IN ('29'))
SELECT pc.gender,
       rt.role,
       cn.name,
       COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN person_candidates AS pc ON ci.person_id = pc.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
JOIN kind_type AS kt ON t.kind_id = kt.id
WHERE t.production_year BETWEEN 1875 AND 1945
  AND kt.kind IN ('episode',
                   'tv mini series',
                   'tv movie',
                   'video game')
  AND rt.role IN ('actor',
                   'cinematographer',
                   'costume designer',
                   'producer')
  AND t.id IN
    (SELECT mi1.movie_id
     FROM movie_info AS mi1
     JOIN info_type AS it1 ON mi1.info_type_id = it1.id
     WHERE it1.id IN ('4')
       AND mi1.info ILIKE '%e%')
GROUP BY pc.gender,
         rt.role,
         cn.name
ORDER BY COUNT(*) DESC;