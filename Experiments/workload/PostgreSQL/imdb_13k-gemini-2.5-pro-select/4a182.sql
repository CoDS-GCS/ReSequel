WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A4163',
                           'A4252',
                           'B1626',
                           'B6515',
                           'G6232',
                           'J545',
                           'L2163',
                           'P3632',
                           'R1525',
                           'S4136',
                           'S524',
                           'T5263')),
     filtered_cast_info AS
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IS NULL),
     filtered_role_type AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor'))
SELECT COUNT(*)
FROM filtered_name AS n
JOIN filtered_cast_info AS ci ON n.id = ci.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN filtered_role_type AS rt ON rt.id = ci.role_id
WHERE pi1.info_type_id IN ('34');