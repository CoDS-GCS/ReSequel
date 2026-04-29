
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('A4214',
                           'C5326',
                           'C6543',
                           'E4524',
                           'E4536',
                           'F6531',
                           'J4236',
                           'J5242',
                           'L6252',
                           'M6256',
                           'M6323',
                           'O4212',
                           'R2456',
                           'V6251')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(writer)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress',
                   'writer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('31')) AS it1 ON pi1.info_type_id = it1.id;