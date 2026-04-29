
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON rt.id = ci.role_id
WHERE n.gender IN ('f')
  AND n.name_pcode_nf IN ('A3652',
                           'A5242',
                           'A5265',
                           'A5325',
                           'E4526',
                           'J5262',
                           'M6453',
                           'M6526',
                           'P3623',
                           'S652',
                           'V4535')
  AND ci.note IS NULL
  AND rt.role IN ('actress')
  AND pi1.info_type_id IN ('26');