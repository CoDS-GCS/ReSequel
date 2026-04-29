
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('B1452',
                           'B6164',
                           'D6341',
                           'E1343',
                           'F5451',
                           'H4526',
                           'J5262',
                           'K51',
                           'M6531',
                           'N5412',
                           'O4262',
                           'P4362',
                           'S3452')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(#1)',
                   '(as Eleni Filiousi)',
                   '(set production assistant)',
                   '(uncredited)',
                   '(writer)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress',
                   'editor',
                   'miscellaneous crew',
                   'writer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('25')) AS it1 ON pi1.info_type_id = it1.id;