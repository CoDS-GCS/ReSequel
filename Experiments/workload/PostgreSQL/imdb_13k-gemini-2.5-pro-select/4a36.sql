
SELECT COUNT(*)
FROM name AS n,
     aka_name AS an,
     person_info AS pi1,
     cast_info AS ci,
     role_type AS rt
WHERE n.id = an.person_id
  AND n.id = pi1.person_id
  AND n.id = ci.person_id
  AND ci.role_id = rt.id
  AND pi1.info_type_id IN ('25')
  AND rt.role IN ('actress')
  AND ci.note IS NULL
  AND n.gender IN ('f')
  AND (n.name_pcode_nf IN ('A4252',
                           'A5165',
                           'A53',
                           'E4526',
                           'M52',
                           'M6456',
                           'M6524',
                           'S5362',
                           'V6521')
       OR n.name_pcode_nf IS NULL);