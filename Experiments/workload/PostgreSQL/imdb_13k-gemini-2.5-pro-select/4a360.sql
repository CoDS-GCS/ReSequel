
SELECT COUNT(*)
FROM info_type AS it1
JOIN person_info AS pi1 ON it1.id = pi1.info_type_id
JOIN name AS n ON pi1.person_id = n.id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE it1.id IN ('34')
  AND (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND n.name_pcode_nf IN ('J5363',
                           'L2524',
                           'M5215',
                           'R4125',
                           'T5416')
  AND ci.note IS NULL
  AND rt.role IN ('actor',
                   'actress');