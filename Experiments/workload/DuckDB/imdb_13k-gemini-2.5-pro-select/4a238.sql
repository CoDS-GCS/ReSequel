
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
  AND (n.name_pcode_nf IN ('C4135',
                           'C5165',
                           'C6412',
                           'C6425',
                           'F6525',
                           'J5424',
                           'L525',
                           'M2451',
                           'P4124',
                           'T5416'))
  AND (ci.note IN ('(uncredited)',
                   '(writer)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'writer'))
  AND (it1.id IN ('26'));