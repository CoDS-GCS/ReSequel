WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IS NULL
     AND name_pcode_nf IN ('A5365',
                           'F6524',
                           'G656',
                           'P4263',
                           'R4141',
                           'S2515',
                           'S5362',
                           'T262')),
     filtered_role AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('composer',
                   'miscellaneous crew',
                   'producer')),
     filtered_info_type AS
  (SELECT id
   FROM info_type
   WHERE id IN ('37'))
SELECT COUNT(*)
FROM filtered_name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN filtered_info_type AS it1 ON pi1.info_type_id = it1.id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN filtered_role AS rt ON ci.role_id = rt.id
WHERE (ci.note IN ('(assistant production coordinator)',
                   '(producer)',
                   '(supervising producer)')
       OR ci.note IS NULL);