
SELECT COUNT(*)
FROM cast_info AS ci
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
WHERE ci.note IS NULL
  AND rt.role IN ('actress')
  AND n.gender IN ('f')
  AND n.name_pcode_nf IN ('A3652',
                           'A5242',
                           'A5265',
                           'A5325',
                           'E4526',
                           'J5262',
                           'M6453',
                           'M6526',
                           'P3623',
                           'S652',
                           'V4535')
  AND pi1.info_type_id IN ('26');