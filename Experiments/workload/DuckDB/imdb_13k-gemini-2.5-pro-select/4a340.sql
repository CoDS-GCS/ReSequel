
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
WHERE n.gender IN ('m')
  AND (n.name_pcode_nf IN ('C6416',
                           'J2516',
                           'J565',
                           'J6263',
                           'S4136',
                           'W4526')
       OR n.name_pcode_nf IS NULL)
  AND ci.note IS NULL
  AND rt.role IN ('actor')
  AND pi1.info_type_id IN ('26');