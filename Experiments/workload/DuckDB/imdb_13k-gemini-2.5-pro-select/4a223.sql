
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE rt.role IN ('actor',
                   'producer')
  AND it1.id IN ('34')
  AND n.gender IN ('m')
  AND n.name_pcode_nf IN ('D1315',
                           'D5231',
                           'E3635',
                           'J52',
                           'M6213',
                           'P4264',
                           'P6154')
  AND (ci.note IN ('(co-executive producer)',
                   '(producer) (as Edward J. Montagne)',
                   '(producer)',
                   '(uncredited)',
                   '(voice)')
       OR ci.note IS NULL);