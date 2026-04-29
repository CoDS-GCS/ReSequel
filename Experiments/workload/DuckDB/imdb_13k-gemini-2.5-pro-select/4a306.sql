
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
WHERE rt.role IN ('actor',
                   'cinematographer',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND (ci.note IN ('(as Duarte Vítor)',
                   '(as Johan)',
                   '(assistant to directors)',
                   '(associate producer)',
                   '(co-executive producer)',
                   '(consulting producer)',
                   '(created by)',
                   '(executive producer)',
                   '(producer)',
                   '(production assistant)',
                   '(production coordinator)',
                   '(script supervisor)',
                   '(supervising producer)',
                   '(uncredited)',
                   '(written by)')
       OR ci.note IS NULL)
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('B6526',
                           'C4532',
                           'C4621',
                           'C6465',
                           'D5414',
                           'D6312',
                           'E3546',
                           'F6523',
                           'J142',
                           'J232',
                           'J316',
                           'J5253',
                           'K1526',
                           'L5245',
                           'M3641',
                           'M5315',
                           'P3536',
                           'R2426',
                           'R2612',
                           'S232',
                           'S3165',
                           'S3526',
                           'S3542'))
  AND it1.id IN ('37');