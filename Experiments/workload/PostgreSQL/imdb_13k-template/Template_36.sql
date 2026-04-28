SELECT COUNT(*)
FROM title AS t,
     kind_type AS kt,
     info_type AS it1,
     movie_info AS mi1,
     cast_info AS ci,
     role_type AS rt,
     name AS n,
     movie_keyword AS mk,
     keyword AS k,
     movie_companies AS mc,
     company_type AS ct,
     company_name AS cn
WHERE t.id = ci.movie_id
  AND t.id = mc.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mk.movie_id
  AND mc.company_type_id = ct.id
  AND mc.company_id = cn.id
  AND k.id = mk.keyword_id
  AND mi1.info_type_id = it1.id
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND (it1.id IN N_SSS_A)
  AND (mi1.info IN N_SSS_B)
  AND (kt.kind IN N_SSS_C)
  AND (rt.role IN N_SSS_D)
  AND (n.gender IS NULL)
  AND (n.surname_pcode IN N_SSS_E
       OR n.surname_pcode IS NULL)
  AND (t.production_year <= ###_A)
  AND (t.production_year >= ###_B)
  AND (cn.name IN N_SSS_F)
  AND (ct.kind IN N_SSS_G)