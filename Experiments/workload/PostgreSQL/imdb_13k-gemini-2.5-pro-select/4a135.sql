
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A5241',
                           'A5362',
                           'A6252',
                           'C6236',
                           'D5415',
                           'G6243',
                           'J2316',
                           'L525',
                           'N4252',
                           'R2632')) AS n
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
   WHERE ROLE IN ('actor',
                   'director',
                   'writer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('34')) AS it1 ON pi1.info_type_id = it1.id;