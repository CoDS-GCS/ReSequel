
SELECT COUNT(*)
FROM cast_info AS ci
JOIN role_type AS rt ON rt.id = ci.role_id
JOIN name AS n ON n.id = ci.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
WHERE n.gender IS NULL
  AND n.name_pcode_nf IN ('D134',
                           'D5253',
                           'J523',
                           'M356',
                           'P4652',
                           'S3162')
  AND (ci.note IN ('(adaptation)',
                   '(legal advisor)',
                   '(line producer)',
                   '(production assistant)',
                   '(technical advisor)')
       OR ci.note IS NULL)
  AND rt.role IN ('costume designer',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('19');