
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
WHERE n.gender IN ('m')
  AND n.name_pcode_nf IN ('A3525',
                           'A6362',
                           'G6215',
                           'G6236',
                           'J212',
                           'J54',
                           'J5452',
                           'J6241',
                           'K5235',
                           'P4165',
                           'T5245')
  AND ci.note IS NULL
  AND pi1.info_type_id IN ('26')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor'));