
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('cinematographer',
                   'composer',
                   'costume designer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer')
  AND (ci.note IN ('(educational advisor)',
                   '(producer)',
                   '(production assistant)',
                   '(production coordinator)')
       OR ci.note IS NULL)
  AND n.gender IS NULL
  AND n.name_pcode_nf IN ('A2314',
                           'A5361',
                           'A6525',
                           'C6415',
                           'D5431',
                           'J2165',
                           'J5245',
                           'J5253',
                           'J5624',
                           'P3523',
                           'R2435',
                           'R2636',
                           'R4123',
                           'R4165',
                           'S3125',
                           'S3152',
                           'S5252',
                           'T2525',
                           'V4641')
  AND it1.id IN ('34');