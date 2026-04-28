SELECT COUNT(*)
FROM title AS t,
     kind_type AS kt,
     movie_info AS mi1,
     info_type AS it1,
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
  AND it1.id = &&&_A
  AND it2.id = &&&_B
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND mi1.info IN N_SSS_A
  AND mi2.info IN N_SSS_B
  AND kt.kind IN N_SSS_C
  AND rt.role IN N_SSS_D
  AND n.gender IN N_SSS_E
  AND t.production_year <= ###_A
  AND ###_B < t.production_year