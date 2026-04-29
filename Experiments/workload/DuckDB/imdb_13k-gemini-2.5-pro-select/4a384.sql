
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IS NULL
     AND (name_pcode_nf IN ('F6521',
                           'G6212',
                           'M2423',
                           'P3623',
                           'R1632',
                           'R2631',
                           'R2632')
          OR name_pcode_nf IS NULL)) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(producer)',
                   '(production assistant)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('composer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('31')) AS it1 ON pi1.info_type_id = it1.id;