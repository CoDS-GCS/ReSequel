
SELECT COUNT(*)
FROM info_type AS it1
JOIN person_info AS pi1 ON it1.id = pi1.info_type_id
JOIN name AS n ON pi1.person_id = n.id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE it1.id IN ('37')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND n.name_pcode_nf IN ('A5362',
                           'G1642',
                           'M6253',
                           'M6261',
                           'S524',
                           'W4163')
  AND ci.note IS NULL
  AND rt.role IN ('actor',
                   'director');