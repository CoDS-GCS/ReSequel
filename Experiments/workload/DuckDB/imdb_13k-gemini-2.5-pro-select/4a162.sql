
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON rt.id = ci.role_id
WHERE n.gender IN ('f')
  AND n.name_pcode_nf IN ('A5235',
                           'C6542',
                           'F6521',
                           'F6532',
                           'J5352',
                           'M5326',
                           'M62',
                           'M6212',
                           'M6216',
                           'M626',
                           'M6456')
  AND ci.note IS NULL
  AND rt.role IN ('actress')
  AND pi1.info_type_id IN ('37');