
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE rt.role IN ('actor',
                   'actress',
                   'director',
                   'producer')
  AND it1.id IN ('37')
  AND n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('A353',
                           'A3621',
                           'A6524',
                           'A6525',
                           'C6235',
                           'D2361',
                           'I252',
                           'J2152',
                           'J4623',
                           'L3253',
                           'L5421',
                           'N5346',
                           'P2423',
                           'P3623',
                           'R2565',
                           'R532',
                           'T362',
                           'W4532',
                           'Y4524')
  AND (ci.note IN ('(associate producer)',
                   '(uncredited)')
       OR ci.note IS NULL);