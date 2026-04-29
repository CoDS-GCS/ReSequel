
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('A2363',
                           'C26',
                           'C3262',
                           'D1534',
                           'D464',
                           'D5262',
                           'E2642',
                           'I1352',
                           'J12',
                           'J6525',
                           'K5125',
                           'K6545',
                           'M4314',
                           'R1632',
                           'U3412',
                           'W5343')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(as Divine)',
                   '(as Jurnee Smollett)',
                   '(nucleus director)',
                   '(production manager officer) (as Karen Almeida-Pedrealba)',
                   '(uncredited)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress',
                   'costume designer',
                   'director',
                   'miscellaneous crew')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('37')) AS it1 ON pi1.info_type_id = it1.id;