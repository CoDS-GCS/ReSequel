
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
WHERE n.gender IS NULL
  AND n.name_pcode_nf IN ('A4526',
                           'A5362',
                           'B6524',
                           'B6535',
                           'C6426',
                           'G6212',
                           'R1632')
  AND (ci.note IN ('(producer)',
                   '(production assistant)')
       OR ci.note IS NULL)
  AND pi1.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('22'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('director',
                   'miscellaneous crew',
                   'producer'));