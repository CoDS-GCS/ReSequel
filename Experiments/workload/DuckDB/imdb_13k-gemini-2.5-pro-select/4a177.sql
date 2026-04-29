
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('25')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'composer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A4532',
                           'B4251',
                           'B5253',
                           'D1321',
                           'F4562',
                           'G1642',
                           'J5251',
                           'J6343',
                           'M234',
                           'M2524',
                           'M4261',
                           'M6325',
                           'P1454',
                           'P4162',
                           'P452',
                           'P4562',
                           'R2153',
                           'S3152',
                           'S5635',
                           'V3653'))
  AND (ci.note IN ('(assistant location manager)',
                   '(associate producer)',
                   '(co-producer)',
                   '(producer)',
                   '(production assistant)',
                   '(script supervisor)',
                   '(uncredited)',
                   '(writer)',
                   '(written by)')
       OR ci.note IS NULL);