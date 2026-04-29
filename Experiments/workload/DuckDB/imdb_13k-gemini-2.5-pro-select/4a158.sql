
SELECT COUNT(*)
FROM cast_info AS ci
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
WHERE ci.note IS NULL
  AND rt.role IN ('actor',
                   'actress')
  AND n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('E6256',
                           'L5325',
                           'M2434',
                           'M6251',
                           'P3624')
  AND pi1.info_type_id IN ('22');