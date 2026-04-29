
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
WHERE n.gender IN ('f')
  AND n.name_pcode_nf IN ('C6435',
                           'D5262',
                           'J5452',
                           'L242',
                           'L652',
                           'S4156',
                           'S5162')
  AND ci.note IS NULL
  AND pi1.info_type_id IN ('26')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress'));