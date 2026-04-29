
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE n.gender IS NULL
  AND n.name_pcode_nf IN ('A4163',
                           'B6524',
                           'B6535',
                           'C6426',
                           'G6212',
                           'M2425',
                           'R1632',
                           'S3152',
                           'W4524')
  AND (ci.note IN ('(producer)',
                   '(production assistant)',
                   '(writer)')
       OR ci.note IS NULL)
  AND rt.role IN ('cinematographer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('26');