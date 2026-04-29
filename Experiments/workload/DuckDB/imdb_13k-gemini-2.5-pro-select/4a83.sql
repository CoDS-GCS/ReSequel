
SELECT COUNT(*)
FROM cast_info AS ci
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
WHERE ci.note IS NULL
  AND rt.role IN ('actor')
  AND n.gender IN ('m')
  AND n.name_pcode_nf IN ('A4236',
                           'B6532',
                           'D1315',
                           'G4651',
                           'J2145',
                           'J2416',
                           'J5241',
                           'J5352',
                           'J6256',
                           'M3252',
                           'R1525',
                           'T5265')
  AND pi1.info_type_id IN ('34');