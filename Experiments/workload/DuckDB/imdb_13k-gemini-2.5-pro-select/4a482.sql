
SELECT COUNT(*)
FROM cast_info AS ci
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
WHERE ci.note IS NULL
  AND rt.role IN ('actor',
                   'director')
  AND n.gender IN ('m')
  AND n.name_pcode_nf IN ('D5254',
                           'E6236',
                           'F6521',
                           'H6325',
                           'J2545',
                           'J5365',
                           'K5452',
                           'M265',
                           'N2452',
                           'P6362')
  AND pi1.info_type_id IN ('26');