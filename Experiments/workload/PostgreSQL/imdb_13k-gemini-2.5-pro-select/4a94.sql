
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A5351',
                           'A6543',
                           'B2414',
                           'B6242',
                           'C5652',
                           'D165',
                           'E6463',
                           'G6262',
                           'J2123',
                           'J2524',
                           'K5425',
                           'M634',
                           'R1426',
                           'R2634',
                           'R2653',
                           'S5145',
                           'T563',
                           'V3535',
                           'W4264',
                           'W6535')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(archive footage)',
                   '(choreographer) (as Kamal)',
                   '(executive producer)',
                   '(production assistant)',
                   '(uncredited)',
                   '(voice)',
                   '(writer)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'writer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('31')) AS it1 ON pi1.info_type_id = it1.id;