
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
WHERE n.gender IN ('m')
  AND n.name_pcode_nf IN ('A4163',
                           'A4252',
                           'B1626',
                           'B6515',
                           'G6232',
                           'J545',
                           'L2163',
                           'P3632',
                           'R1525',
                           'S4136',
                           'S524',
                           'T5263')
  AND ci.note IS NULL
  AND pi1.info_type_id IN ('34')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor'));