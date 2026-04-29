
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
  AND (n.name_pcode_nf IN ('B3621',
                           'C2456',
                           'C5616',
                           'E1525',
                           'K542',
                           'M3261',
                           'M6242',
                           'S2526',
                           'S4354'))
  AND (ci.note IN ('(credit only)',
                   '(producer)',
                   '(voice)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'actress',
                   'producer'))
  AND (it1.id IN ('26'));