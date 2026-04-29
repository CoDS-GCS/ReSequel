
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
WHERE rt.role IN ('actor',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND (ci.note IN ('(executive producer)',
                   '(producer)',
                   '(production assistant)')
       OR ci.note IS NULL)
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A2623',
                           'D1352',
                           'D5436',
                           'D6215',
                           'F6524',
                           'I2523',
                           'K2562',
                           'L2615',
                           'M3526',
                           'R2632',
                           'S3145',
                           'T5212',
                           'W4536'))
  AND it1.id IN ('34');