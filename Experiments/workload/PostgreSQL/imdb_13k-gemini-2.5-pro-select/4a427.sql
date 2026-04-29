
SELECT COUNT(*)
FROM cast_info AS ci
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
JOIN info_type AS it1 ON pi.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE ci.note IS NULL
  AND rt.role IN ('actor',
                   'actress')
  AND (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND n.name_pcode_nf IN ('C6426',
                           'E4525',
                           'J2353',
                           'J5231',
                           'J525',
                           'M624',
                           'M6256',
                           'P4216',
                           'T5241')
  AND it1.id IN ('34');