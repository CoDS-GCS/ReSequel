
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE n.gender IN ('f')
  AND n.name_pcode_nf IN ('A2426',
                           'A3621',
                           'D5215',
                           'I2352',
                           'I253',
                           'P3165',
                           'S4561',
                           'V62',
                           'Y412',
                           'Z14')
  AND (ci.note IN ('(as Ice La Fox)',
                   '(voice)')
       OR ci.note IS NULL)
  AND rt.role IN ('actress')
  AND it1.id IN ('37');