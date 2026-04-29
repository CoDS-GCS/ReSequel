
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
WHERE n.gender IS NULL
  AND n.name_pcode_nf IN ('A53',
                           'A5345',
                           'C6352',
                           'C6452',
                           'D1352',
                           'G6253',
                           'I641',
                           'J2165',
                           'J2516',
                           'J5353',
                           'P2651',
                           'R2563',
                           'S2312',
                           'S3154',
                           'T32',
                           'T5325',
                           'T56')
  AND (ci.note IN ('(associate producer)',
                   '(co-creator)',
                   '(executive producer)',
                   '(line producer)',
                   '(producer)',
                   '(producer: Fuji TV)',
                   '(production accountant)',
                   '(production assistant)',
                   '(script supervisor)',
                   '(supervising producer)',
                   '(writer)')
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
                   'producer',
                   'production designer',
                   'writer'));