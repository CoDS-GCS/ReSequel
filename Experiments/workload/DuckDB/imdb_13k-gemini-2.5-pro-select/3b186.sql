
SELECT t.title,
       n.name,
       cn.name,
       COUNT(*)
FROM title AS t,
     movie_keyword AS mk,
     keyword AS k,
     movie_companies AS mc,
     company_name AS cn,
     company_type AS ct,
     kind_type AS kt,
     cast_info AS ci,
     name AS n,
     role_type AS rt
WHERE t.id = mk.movie_id
  AND t.id = mc.movie_id
  AND t.id = ci.movie_id
  AND k.id = mk.keyword_id
  AND cn.id = mc.company_id
  AND ct.id = mc.company_type_id
  AND kt.id = t.kind_id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND t.title ILIKE '%sp%'
  AND n.name_pcode_cf ILIKE '%h45%'
  AND cn.name ILIKE '%pro%'
  AND kt.kind IN ('movie',
                   'tv movie',
                   'video game',
                   'video movie')
  AND rt.role IN ('cinematographer',
                   'costume designer',
                   'director',
                   'editor',
                   'production designer',
                   'writer')
GROUP BY t.title,
         n.name,
         cn.name
ORDER BY COUNT(*) DESC