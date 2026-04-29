
SELECT COUNT(*)
FROM cast_info AS ci
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
WHERE ci.note IS NULL
  AND rt.role IN ('actress')
  AND n.gender IN ('f')
  AND n.name_pcode_nf IN ('A5141',
                           'A5246',
                           'C6451',
                           'F6521',
                           'G1642',
                           'K3651',
                           'M6362',
                           'M6526',
                           'S1524',
                           'S5361',
                           'S6163')
  AND pi1.info_type_id IN ('37');