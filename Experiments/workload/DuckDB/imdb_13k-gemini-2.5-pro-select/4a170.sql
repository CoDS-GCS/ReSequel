
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('19')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'composer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A212',
                           'A2532',
                           'A4235',
                           'D252',
                           'E6216',
                           'H4236',
                           'I252',
                           'J213',
                           'J2152',
                           'J23',
                           'J2523',
                           'J4253',
                           'J4265',
                           'J5125',
                           'J5425',
                           'M6152',
                           'M6232',
                           'M6256',
                           'M6525',
                           'N2314',
                           'R1524',
                           'R4126',
                           'S5325',
                           'S6536'))
  AND (ci.note IN ('(associate head writer)',
                   '(legal)',
                   '(medic) (as Robin Michels)',
                   '(producer)',
                   '(production assistant)',
                   '(production coordinator)',
                   '(voice)')
       OR ci.note IS NULL);