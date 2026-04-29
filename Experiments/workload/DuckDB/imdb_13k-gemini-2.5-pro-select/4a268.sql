
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE n.gender IS NULL
  AND n.name_pcode_nf IN ('A4253',
                           'A5362',
                           'C6231',
                           'C6235',
                           'M6216',
                           'R5316',
                           'S3152')
  AND (ci.note IN ('(executive producer)',
                   '(production assistant)',
                   '(supervising producer)',
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