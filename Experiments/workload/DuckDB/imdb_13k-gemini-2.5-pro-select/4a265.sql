
SELECT COUNT(*)
FROM name AS n,
     aka_name AS an,
     info_type AS it1,
     person_info AS pi1,
     cast_info AS ci,
     role_type AS rt
WHERE n.id = an.person_id
  AND n.id = pi1.person_id
  AND n.id = ci.person_id
  AND pi1.info_type_id = it1.id
  AND ci.role_id = rt.id
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A452',
                           'B6356',
                           'C4652',
                           'C6526',
                           'D125',
                           'D1625',
                           'D2635',
                           'D5216',
                           'D5431',
                           'E3632',
                           'G2',
                           'H2362',
                           'H6323',
                           'J1516',
                           'J512',
                           'K6542',
                           'M2416',
                           'M2453',
                           'M6243',
                           'P1616',
                           'R1425',
                           'S3152',
                           'S6261',
                           'T256',
                           'T5325'))
  AND (ci.note IN ('(credit only)',
                   '(executive producer)',
                   '(key set production assistant)',
                   '(location manager)',
                   '(producer)',
                   '(production assistant)',
                   '(screenplay)',
                   '(script supervisor)',
                   '(technical coordinator)',
                   '(technical director) (as Doms Paragas)',
                   '(uncredited)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actress',
                   'cinematographer',
                   'composer',
                   'costume designer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer'))
  AND (it1.id IN ('22'));