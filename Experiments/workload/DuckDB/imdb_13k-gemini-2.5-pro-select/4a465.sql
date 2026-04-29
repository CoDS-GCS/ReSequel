
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
WHERE n.gender IS NULL
  AND n.name_pcode_nf IN ('A2525',
                           'D5215',
                           'L242',
                           'M6324',
                           'S3151')
  AND (ci.note IN ('(assistant to producer)',
                   '(producer) (outdoors)',
                   '(producer)',
                   '(production accountant)')
       OR ci.note IS NULL)
  AND pi1.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('26'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('editor',
                   'miscellaneous crew',
                   'producer'));