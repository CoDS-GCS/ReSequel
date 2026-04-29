
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A2356',
                           'A452',
                           'D5351',
                           'E3632',
                           'I6562',
                           'J5245',
                           'J6354',
                           'K3232',
                           'K5313',
                           'M2421',
                           'M2456',
                           'M5432',
                           'M625',
                           'R2625',
                           'S3256',
                           'S5313',
                           'T253',
                           'T5165',
                           'T6245'))
  AND (ci.note IN ('(associate producer)',
                   '(co-executive producer)',
                   '(director of photography)',
                   '(executive producer)',
                   '(field producer)',
                   '(producer)',
                   '(senior producer)',
                   '(series director)',
                   '(supervising producer)',
                   '(technical director)',
                   '(tutor)',
                   '(uncredited)',
                   '(writer)',
                   '(written by)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'cinematographer',
                   'composer',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('32');