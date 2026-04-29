
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE n.gender IN ('f')
  AND n.name_pcode_nf IN ('A5164',
                           'A5323',
                           'D5234',
                           'D5452',
                           'E5252',
                           'G6253',
                           'J252',
                           'J56',
                           'L4525',
                           'T6236')
  AND (ci.note IN ('(voice)')
       OR ci.note IS NULL)
  AND rt.role IN ('actress')
  AND it1.id IN ('22');