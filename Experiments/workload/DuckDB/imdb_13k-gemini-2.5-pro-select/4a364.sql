
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
WHERE n.gender IS NULL
  AND n.name_pcode_nf IN ('C6426',
                           'J5231',
                           'J6526',
                           'L2536',
                           'L6252',
                           'M4521',
                           'R1523',
                           'R525',
                           'R61')
  AND (ci.note IN ('(as Ray R. Harp)',
                   '(line producer)',
                   '(producer)',
                   '(producer: Servus TV)',
                   '(production assistant)',
                   '(story)')
       OR ci.note IS NULL)
  AND pi1.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('25'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('cinematographer',
                   'costume designer',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'writer'));