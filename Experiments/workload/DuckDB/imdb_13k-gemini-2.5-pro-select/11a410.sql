
SELECT n.gender,
       rt.role,
       cn.name,
       COUNT(*)
FROM title AS t,
     movie_companies AS mc,
     company_name AS cn,
     kind_type AS kt,
     cast_info AS ci,
     name AS n,
     role_type AS rt,
     movie_info AS mi1
WHERE t.id = mc.movie_id
  AND t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND cn.id = mc.company_id
  AND kt.id = t.kind_id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND kt.kind ILIKE '%vid%'
  AND rt.role IN ('actor',
                   'costume designer',
                   'guest')
  AND t.production_year <= 2015
  AND t.production_year >= 1875
  AND mi1.info_type_id IN ('3')
  AND mi1.info ILIKE '%ne%'
  AND cn.name ILIKE '%pr%'
GROUP BY n.gender,
         rt.role,
         cn.name
ORDER BY COUNT(*) DESC;