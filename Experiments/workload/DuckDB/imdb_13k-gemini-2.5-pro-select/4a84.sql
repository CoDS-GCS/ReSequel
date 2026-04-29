
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
  AND (n.name_pcode_nf IN ('A2565',
                           'A354',
                           'A5163',
                           'C5256',
                           'E5425',
                           'E6523',
                           'H5623',
                           'L2415',
                           'L5652',
                           'R26',
                           'S154',
                           'S3154',
                           'S516',
                           'T5316',
                           'T6153',
                           'T625',
                           'W5352',
                           'Z2'))
  AND (ci.note IN ('(assistant)',
                   '(executive producer)',
                   '(marketing)',
                   '(producer)',
                   '(production assistant)',
                   '(production coordinator) (as Erin E. Stewart)',
                   '(production coordinator)',
                   '(set teacher)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actress',
                   'cinematographer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer'))
  AND (it1.id IN ('32'));