
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
  AND (n.name_pcode_nf IN ('A5354',
                           'K3623',
                           'L624',
                           'T526',
                           'Y15'))
  AND (ci.note IN ('(field cashier) (as Leah Arquillo)',
                   '(production executive)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actress',
                   'miscellaneous crew'))
  AND (it1.id IN ('19'));