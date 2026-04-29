WITH filtered_name AS
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
                           'W5343'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON fn.id = an.person_id
WHERE rt.role IN ('actress',
                   'costume designer',
                   'director',
                   'miscellaneous crew')
  AND it1.id IN ('37')
  AND (ci.note IN ('(as Divine)',
                   '(as Jurnee Smollett)',
                   '(nucleus director)',
                   '(production manager officer) (as Karen Almeida-Pedrealba)',
                   '(uncredited)')
       OR ci.note IS NULL);