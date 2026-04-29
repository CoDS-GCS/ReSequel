
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
  AND (n.name_pcode_nf IN ('B6325',
                           'C2145',
                           'D5245',
                           'D5626',
                           'G6561',
                           'I2161',
                           'J5142',
                           'L24',
                           'M6535',
                           'O3432',
                           'R356',
                           'R5625',
                           'S2325',
                           'S5246',
                           'S5265',
                           'T2'))
  AND (ci.note IN ('(creator)',
                   '(credit only)',
                   '(producer) (uncredited)',
                   '(producer)',
                   '(production assistant)',
                   '(script supervisor)',
                   '(voice: Japanese version)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'cinematographer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer'))
  AND (it1.id IN ('31'));