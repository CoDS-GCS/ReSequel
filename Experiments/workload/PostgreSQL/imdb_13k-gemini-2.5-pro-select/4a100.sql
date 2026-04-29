WITH filtered_names AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A2351',
                           'C6242',
                           'D2426',
                           'F6353',
                           'J2421',
                           'N25',
                           'R5253')),
     filtered_akas AS
  (SELECT person_id
   FROM aka_name),
     filtered_pi AS
  (SELECT pi1.person_id
   FROM person_info AS pi1
   JOIN info_type AS it1 ON pi1.info_type_id = it1.id
   WHERE it1.id IN ('31')),
     filtered_ci AS
  (SELECT ci.person_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE ci.note IS NULL
     AND rt.role IN ('actor'))
SELECT COUNT(*)
FROM filtered_names fn
JOIN filtered_akas fa ON fn.id = fa.person_id
JOIN filtered_pi fp ON fn.id = fp.person_id
JOIN filtered_ci fc ON fn.id = fc.person_id;