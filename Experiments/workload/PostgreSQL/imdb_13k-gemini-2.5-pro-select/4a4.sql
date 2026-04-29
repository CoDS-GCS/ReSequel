
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON rt.id = ci.role_id
WHERE n.gender IN ('m')
  AND n.name_pcode_nf IN ('A6525',
                           'D252',
                           'H5256',
                           'H5623',
                           'J2514',
                           'P416',
                           'R256',
                           'R5341',
                           'S526')
  AND ci.note IS NULL
  AND rt.role IN ('actor')
  AND pi1.info_type_id IN ('25');