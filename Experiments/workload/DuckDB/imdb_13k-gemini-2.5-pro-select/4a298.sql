
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
WHERE rt.role IN ('actress',
                   'composer',
                   'miscellaneous crew',
                   'production designer')
  AND (ci.note IN ('(audience page)',
                   '(office production assistant)',
                   '(production coordinator)')
       OR ci.note IS NULL)
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('K525',
                           'L2513',
                           'L6521',
                           'M3462',
                           'P3635',
                           'S6262',
                           'T134'))
  AND it1.id IN ('32');