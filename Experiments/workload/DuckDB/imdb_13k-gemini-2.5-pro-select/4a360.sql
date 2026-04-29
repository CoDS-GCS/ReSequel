
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi ON n.id = pi.person_id
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND n.name_pcode_nf IN ('J5363',
                           'L2524',
                           'M5215',
                           'R4125',
                           'T5416')
  AND ci.note IS NULL
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'actress'))
  AND pi.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('34'));