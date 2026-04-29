
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE rt.role IN ('actor',
                   'composer',
                   'costume designer',
                   'director',
                   'editor',
                   'producer',
                   'writer')
  AND it1.id IN ('31')
  AND n.gender IN ('m')
  AND n.name_pcode_nf IN ('A6364',
                           'B4236',
                           'C3453',
                           'C532',
                           'D1353',
                           'D5425',
                           'G526',
                           'J2351',
                           'J2354',
                           'J2532',
                           'M21',
                           'M4252',
                           'O4142',
                           'P4262',
                           'R5342',
                           'R5625',
                           'T2653',
                           'U4623',
                           'V4356')
  AND (ci.note IN ('(as Gov. Mike Huckabee)',
                   '(producer)',
                   '(uncredited)',
                   '(voice)',
                   '(writer)')
       OR ci.note IS NULL);