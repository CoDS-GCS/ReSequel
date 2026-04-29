
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi ON n.id = pi.person_id
JOIN info_type AS it1 ON pi.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND n.name_pcode_nf IN ('D52',
                           'D525',
                           'G1642',
                           'G6325',
                           'J5263')
  AND ci.note IS NULL
  AND rt.role IN ('actor')
  AND it1.id IN ('37');