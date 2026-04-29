
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
  AND (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A4354',
                           'D5654',
                           'G6345',
                           'J6316',
                           'J6524',
                           'M1536',
                           'M241',
                           'M32',
                           'S2316',
                           'V2412'))
  AND (ci.note IN ('(creator)',
                   '(executive producer)',
                   '(technical manager)',
                   '(voice)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actress',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer'))
  AND (it1.id IN ('25'));