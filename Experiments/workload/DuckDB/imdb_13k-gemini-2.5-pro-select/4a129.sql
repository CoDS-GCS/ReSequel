
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi ON n.id = pi.person_id
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND n.name_pcode_nf IN ('A5216',
                           'C6452',
                           'G6325',
                           'I2141',
                           'I6526',
                           'J5165',
                           'M2',
                           'M2345',
                           'M6352',
                           'T6216',
                           'V4535')
  AND ci.note IS NULL
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress'))
  AND pi.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('25'));