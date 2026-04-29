
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
WHERE n.gender IS NULL
  AND n.name_pcode_nf IN ('A5142',
                           'F2325',
                           'H3525',
                           'J2142',
                           'J5231',
                           'R625',
                           'S2363',
                           'S5163',
                           'V4535')
  AND (ci.note IN ('(assistant production coordinator)',
                   '(associate producer) (as Fausto Sainz)',
                   '(character design)',
                   '(executive producer)',
                   '(technical director)')
       OR ci.note IS NULL)
  AND pi1.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('19'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('costume designer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer'));