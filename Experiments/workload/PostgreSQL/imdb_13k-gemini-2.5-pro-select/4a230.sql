
SELECT COUNT(*)
FROM cast_info AS ci
JOIN role_type AS rt ON rt.id = ci.role_id
JOIN name AS n ON n.id = ci.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
WHERE n.gender IS NULL
  AND n.name_pcode_nf IN ('A4526',
                           'A5362',
                           'B6524',
                           'C6231',
                           'C6424',
                           'C6426',
                           'M2425',
                           'M2426',
                           'R1632',
                           'S3152',
                           'W4524')
  AND (ci.note IN ('(executive producer)',
                   '(producer)',
                   '(production assistant)',
                   '(writer)')
       OR ci.note IS NULL)
  AND rt.role IN ('cinematographer',
                   'composer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('19');