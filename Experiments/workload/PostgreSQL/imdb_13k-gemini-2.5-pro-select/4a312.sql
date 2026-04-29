
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('D1321',
                           'D3425',
                           'F1625',
                           'H6256',
                           'J1353',
                           'M23',
                           'P6525',
                           'V6514')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(researcher)',
                   '(writer)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'actress',
                   'composer',
                   'miscellaneous crew',
                   'writer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('34')) AS it1 ON pi1.info_type_id = it1.id;