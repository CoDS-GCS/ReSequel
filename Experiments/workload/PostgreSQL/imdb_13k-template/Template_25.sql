SELECT COUNT(*)
FROM title AS t,
     kind_type AS kt,
     info_type AS it1,
     movie_info AS mi1,
     movie_info AS mi2,
     info_type AS it2,
     cast_info AS ci,
     role_type AS rt,
     name AS n
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND mi1.movie_id = mi2.movie_id
  AND mi1.info_type_id = it1.id
  AND mi2.info_type_id = it2.id
  AND (it1.id IN N_SSS_A)
  AND (it2.id IN N_SSS_B)
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND (mi1.info IN N_SSS_C)
  AND (mi2.info IN N_SSS_D)
  AND (kt.kind IN N_SSS_E)
  AND (rt.role IN N_SSS_F)
  AND (n.gender IN N_SSS_G)
  AND (t.production_year <= ###_A)
  AND (t.production_year >= ###_B)
  AND (t.title IN N_SSS_H)