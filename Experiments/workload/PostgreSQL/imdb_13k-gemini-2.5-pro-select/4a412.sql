
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE rt.role IN ('actor',
                   'editor',
                   'miscellaneous crew',
                   'producer')
  AND it1.id IN ('31')
  AND n.gender IN ('m')
  AND n.name_pcode_nf IN ('B6536',
                           'C6263',
                           'F6362',
                           'J52',
                           'K3256',
                           'R26')
  AND (ci.note IN ('(Ken Washio)',
                   '(armorer)',
                   '(production consultant)',
                   '(supervising producer)',
                   '(uncredited)')
       OR ci.note IS NULL);