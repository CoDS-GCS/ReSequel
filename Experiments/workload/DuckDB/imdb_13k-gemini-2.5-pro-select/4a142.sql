
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE n.gender IN ('f')
  AND n.name_pcode_nf IN ('C6235',
                           'D5426',
                           'E1263',
                           'E2361',
                           'E6212',
                           'G1426',
                           'J43',
                           'J5153',
                           'J5456',
                           'K4123',
                           'K6425',
                           'L6562',
                           'M4232',
                           'M6121',
                           'M6326',
                           'N2423',
                           'N3215',
                           'N624',
                           'R1251',
                           'S216',
                           'T465',
                           'W5324')
  AND (ci.note IN ('(senior production accountant)',
                   '(voice)')
       OR ci.note IS NULL)
  AND rt.role IN ('actress',
                   'director',
                   'miscellaneous crew')
  AND it1.id IN ('22');