
SELECT COUNT(*)
FROM cast_info AS ci
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE ci.note IS NULL
  AND rt.role IN ('actor',
                   'actress')
  AND n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('A4216',
                           'C6525',
                           'D1354',
                           'J5232',
                           'M2525')
  AND it1.id IN ('34');