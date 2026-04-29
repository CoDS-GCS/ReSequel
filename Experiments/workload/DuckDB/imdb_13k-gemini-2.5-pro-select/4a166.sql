
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A4263',
                           'B6535',
                           'D53',
                           'F6525',
                           'G4526',
                           'G625',
                           'G6532',
                           'L2526',
                           'M252',
                           'P6362',
                           'R1416',
                           'R1635',
                           'R2165',
                           'V3656'))
  AND (ci.note IN ('(producer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'producer')
  AND it1.id IN ('37');