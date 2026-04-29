
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
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('B6534',
                           'C2623',
                           'D6523',
                           'G6524',
                           'I1542',
                           'J2352',
                           'J31',
                           'J4215',
                           'J5126',
                           'J5163',
                           'J5243',
                           'N21',
                           'P3626',
                           'S3132'))
  AND (ci.note IN ('(as Jon Bauman)',
                   '(associate producer)',
                   '(creator)',
                   '(delegate producer)',
                   '(production assistant)',
                   '(stage manager)',
                   '(voice)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'composer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer'))
  AND (it1.id IN ('31'));