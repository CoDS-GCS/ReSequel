
SELECT COUNT(*)
FROM cast_info AS ci
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
WHERE ci.note IS NULL
  AND rt.role IN ('actress')
  AND n.gender IN ('f')
  AND n.name_pcode_nf IN ('E2364',
                           'I2141',
                           'M6252',
                           'M6254',
                           'M6352',
                           'S3152',
                           'V6525')
  AND pi1.info_type_id IN ('19');