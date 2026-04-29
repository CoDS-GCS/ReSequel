
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
WHERE n.gender IS NULL
  AND n.name_pcode_nf IN ('A4163',
                           'A4253',
                           'C6231',
                           'G6212',
                           'M2423',
                           'M2425',
                           'M5456',
                           'P3623',
                           'R2632',
                           'S3152')
  AND (ci.note IN ('(executive producer)',
                   '(producer)',
                   '(writer)')
       OR ci.note IS NULL)
  AND pi1.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('25'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('composer',
                   'director',
                   'editor',
                   'producer',
                   'writer'));