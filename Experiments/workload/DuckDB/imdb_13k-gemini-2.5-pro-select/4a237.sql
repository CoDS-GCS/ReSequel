
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('22')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'director',
                   'producer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('B6362',
                           'C6425',
                           'D2564',
                           'G4526',
                           'G6213',
                           'J4525',
                           'J5363',
                           'J6351',
                           'M6216',
                           'P3623'))
  AND (ci.note IN ('(executive producer)',
                   '(uncredited)')
       OR ci.note IS NULL);