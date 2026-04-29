
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
WHERE n.gender IN ('f')
  AND (n.name_pcode_nf IN ('A4252',
                           'A5165',
                           'A53',
                           'E4526',
                           'M52',
                           'M6456',
                           'M6524',
                           'S5362',
                           'V6521')
       OR n.name_pcode_nf IS NULL)
  AND ci.note IS NULL
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress'))
  AND pi1.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('25'));