
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON rt.id = ci.role_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A4264',
                           'A5351',
                           'B6252',
                           'C6231',
                           'C6234',
                           'C6532',
                           'D1315',
                           'D5243',
                           'D6532',
                           'J253',
                           'J5234',
                           'J5352',
                           'M2415',
                           'M6452',
                           'R3414',
                           'S342',
                           'S3632',
                           'T1431',
                           'Y524'))
  AND (ci.note IN ('(adaptation)',
                   '(executive producer)',
                   '(helicopter pilot)',
                   '(producer)',
                   '(production staff)',
                   '(researcher)',
                   '(staging services)',
                   '(utility)',
                   '(writer)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'composer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer'))
  AND (it1.id IN ('22'));