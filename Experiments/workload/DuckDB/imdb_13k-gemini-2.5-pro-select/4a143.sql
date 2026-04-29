
SELECT COUNT(*)
FROM cast_info AS ci
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
JOIN info_type AS it1 ON pi.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE ci.note IS NULL
  AND rt.role IN ('actress')
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND n.name_pcode_nf IN ('A5136',
                           'H4525',
                           'J4262',
                           'M4252',
                           'M6356',
                           'N5242')
  AND it1.id IN ('34');