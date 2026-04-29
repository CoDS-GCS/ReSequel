
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('34')) AS filtered_it ON pi1.info_type_id = filtered_it.id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor')) AS filtered_rt ON ci.role_id = filtered_rt.id
WHERE n.gender IN ('m')
  AND n.name_pcode_nf IN ('A4163',
                           'A6364',
                           'C6252',
                           'D1352',
                           'H5625',
                           'J515',
                           'J5262',
                           'M2452',
                           'M625',
                           'P4153',
                           'R52',
                           'S5165',
                           'T5235')
  AND ci.note IS NULL;