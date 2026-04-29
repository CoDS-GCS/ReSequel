
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('cinematographer',
                   'composer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND (ci.note IN ('(associate producer)',
                   '(producer)',
                   '(production assistant)',
                   '(technical advisor)',
                   '(translator)',
                   '(writer) (as Danica Mae Domingo)')
       OR ci.note IS NULL)
  AND n.gender IS NULL
  AND (n.name_pcode_nf IN ('A5254',
                           'C4142',
                           'C6416',
                           'C6423',
                           'D1325',
                           'D1343',
                           'D542',
                           'D5424',
                           'E3523',
                           'E3632',
                           'G6435',
                           'H5262',
                           'J5214',
                           'M5636',
                           'S3125',
                           'W6561',
                           'X162')
       OR n.name_pcode_nf IS NULL)
  AND it1.id IN ('26');