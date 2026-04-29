
SELECT COUNT(*)
FROM info_type AS it1
JOIN person_info AS pi1 ON it1.id = pi1.info_type_id
JOIN name AS n ON pi1.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE it1.id IN ('32')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A5652',
                           'B6535',
                           'C6252',
                           'E1635',
                           'M5624',
                           'M6353',
                           'N2426',
                           'O2431',
                           'P3641',
                           'R3264',
                           'S2363',
                           'S3232'))
  AND (ci.note IN ('(associate producer)',
                   '(based on a story by)',
                   '(production assistant)',
                   '(writer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'writer');