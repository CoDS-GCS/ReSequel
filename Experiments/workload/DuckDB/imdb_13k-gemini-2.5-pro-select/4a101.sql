
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE n.gender IN ('m')
  AND n.name_pcode_nf IN ('A4163',
                           'B5252',
                           'D1321',
                           'F6524',
                           'F6532',
                           'G6265',
                           'J5261',
                           'J5263',
                           'K5235',
                           'L5635',
                           'M6256',
                           'P3652',
                           'S6216',
                           'T5235',
                           'T525')
  AND (ci.note IN ('(voice)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor')
  AND it1.id IN ('31');