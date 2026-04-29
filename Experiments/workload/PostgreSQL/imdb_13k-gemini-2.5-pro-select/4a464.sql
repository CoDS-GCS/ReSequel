
SELECT COUNT(*)
FROM cast_info AS ci
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE ci.note IS NULL
  AND rt.role IN ('actress')
  AND n.gender IN ('f')
  AND n.name_pcode_nf IN ('A5145',
                           'A524',
                           'B6532',
                           'G6252',
                           'I2145',
                           'J2452',
                           'J5263',
                           'M25',
                           'M6216',
                           'M6261',
                           'M6353',
                           'M6354',
                           'M6563',
                           'R2453',
                           'R3245')
  AND it1.id IN ('34');