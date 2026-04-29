
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('25')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'director',
                   'producer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('D1324',
                           'D5423',
                           'F6524',
                           'G2316',
                           'J2421',
                           'J5626',
                           'J6265',
                           'L5252',
                           'P6262',
                           'R1634',
                           'R3415',
                           'R4531',
                           'R4532',
                           'T6252'))
  AND (ci.note IN ('(executive producer)')
       OR ci.note IS NULL);