
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
WHERE n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('A6543',
                           'E4525',
                           'F6526',
                           'G4163',
                           'H5252',
                           'I5263',
                           'J2163',
                           'J5325',
                           'K1526',
                           'M2454',
                           'M6216',
                           'M6243',
                           'M6353',
                           'R532',
                           'T5162')
  AND ci.note IS NULL
  AND pi1.info_type_id IN ('32')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'actress'));