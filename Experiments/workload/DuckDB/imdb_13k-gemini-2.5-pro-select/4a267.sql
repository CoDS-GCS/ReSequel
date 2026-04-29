
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE n.gender IN ('f')
  AND n.name_pcode_nf IN ('B6236',
                           'H5231',
                           'J2436',
                           'O346',
                           'R236')
  AND (ci.note IN ('(script supervisor)')
       OR ci.note IS NULL)
  AND rt.role IN ('actress',
                   'director',
                   'miscellaneous crew')
  AND it1.id IN ('37');