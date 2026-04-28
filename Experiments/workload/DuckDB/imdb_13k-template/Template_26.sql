SELECT COUNT(*)
FROM title AS t,
     movie_info AS mi1,
     kind_type AS kt,
     info_type AS it1,
     info_type AS it3,
     info_type AS it4,
     movie_info_idx AS mii1,
     movie_info_idx AS mii2,
     aka_name AS an,
     name AS n,
     info_type AS it5,
     person_info AS pi1,
     cast_info AS ci,
     role_type AS rt
WHERE t.id = mi1.movie_id
  AND t.id = ci.movie_id
  AND t.id = mii1.movie_id
  AND t.id = mii2.movie_id
  AND mii2.movie_id = mii1.movie_id
  AND mi1.movie_id = mii1.movie_id
  AND mi1.info_type_id = it1.id
  AND mii1.info_type_id = it3.id
  AND mii2.info_type_id = it4.id
  AND t.kind_id = kt.id
  AND (kt.kind IN N_SSS_A)
  AND (t.production_year <= ###_A)
  AND (t.production_year >= ###_B)
  AND (mi1.info IN N_SSS_B)
  AND (it1.id IN N_SSS_C)
  AND it3.id = &&&_A
  AND it4.id = &&&_B
  AND (mii2.info ~ &&&_C
       AND mii2.info::float <= ^^^_A)
  AND (mii2.info ~ &&&_D
       AND ^^^_B <= mii2.info::float)
  AND (mii1.info ~ &&&_E
       AND ^^^_C <= mii1.info::float)
  AND (mii1.info ~ &&&_F
       AND mii1.info::float <= ^^^_D)
  AND n.id = ci.person_id
  AND ci.person_id = pi1.person_id
  AND it5.id = pi1.info_type_id
  AND n.id = pi1.person_id
  AND n.id = an.person_id
  AND ci.person_id = an.person_id
  AND an.person_id = pi1.person_id
  AND rt.id = ci.role_id
  AND (n.gender IN N_SSS_D
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN N_SSS_E
       OR n.name_pcode_nf IS NULL)
  AND (ci.note IN N_SSS_F
       OR ci.note IS NULL)
  AND (rt.role IN N_SSS_G)
  AND (it5.id IN N_SSS_H)