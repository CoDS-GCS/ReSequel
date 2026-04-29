
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('B6525',
                           'F6534',
                           'I5353',
                           'M5342',
                           'M6215',
                           'O262',
                           'P6263',
                           'R2651',
                           'W4516')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(contributing writer)',
                   '(executive producer)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'director',
                   'miscellaneous crew',
                   'producer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('25')) AS it1 ON pi1.info_type_id = it1.id;