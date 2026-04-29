
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi ON n.id = pi.person_id
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND n.name_pcode_nf IN ('B1642',
                           'B6352',
                           'J3261',
                           'M5456',
                           'M6453',
                           'M6525',
                           'M6536',
                           'M6563')
  AND ci.note IS NULL
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress'))
  AND pi.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('25'));