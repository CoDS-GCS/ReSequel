
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
  AND (n.name_pcode_nf IN ('B564',
                           'E2563',
                           'H5621',
                           'M2456',
                           'M2635',
                           'M52',
                           'M5252'))
  AND (ci.note IN ('(co-producer)',
                   '(executive producer)',
                   '(location manager)',
                   '(voice)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'cinematographer',
                   'miscellaneous crew',
                   'producer'))
  AND (it1.id IN ('19'));