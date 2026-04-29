
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
  AND (n.name_pcode_nf IN ('A5434',
                           'B4264',
                           'C6252',
                           'C6452',
                           'E6252',
                           'G2632',
                           'J2526',
                           'K652',
                           'L323',
                           'R14',
                           'S1435'))
  AND (ci.note IN ('(as Anna Little)',
                   '(assistant to executive producer)',
                   '(field producer)',
                   '(senior producer)',
                   '(stage manager)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'actress',
                   'costume designer',
                   'director',
                   'miscellaneous crew',
                   'producer'))
  AND (it1.id IN ('37'));