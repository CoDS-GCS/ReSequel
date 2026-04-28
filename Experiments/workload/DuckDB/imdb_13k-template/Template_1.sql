SELECT COUNT(*)
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
  AND ci.movie_id = mc.movie_id
  AND ci.movie_id = mk.movie_id
  AND mk.movie_id = mc.movie_id
  AND k.id = mk.keyword_id
  AND cn.id = mc.company_id
  AND ct.id = mc.company_type_id
  AND kt.id = t.kind_id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND t.production_year <= ###_A
  AND ###_B < t.production_year
  AND k.keyword IN N_SSS_A
  AND cn.country_code IN N_SSS_B
  AND ct.kind IN N_SSS_C
  AND kt.kind IN N_SSS_D
  AND rt.role IN N_SSS_E
  AND n.gender IN N_SSS_F