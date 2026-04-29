
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON rt.id = ci.role_id
WHERE n.gender IN ('f')
  AND n.name_pcode_nf IN ('B3526',
                           'B6165',
                           'C3563',
                           'J5646',
                           'O1453',
                           'T4635',
                           'V4641')
  AND ci.note IS NULL
  AND rt.role IN ('actress',
                   'director',
                   'editor')
  AND pi1.info_type_id IN ('31');