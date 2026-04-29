
SELECT COUNT(*)
FROM info_type AS it1
JOIN person_info AS pi1 ON it1.id = pi1.info_type_id
JOIN name AS n ON pi1.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE it1.id IN ('32')
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('K525',
                           'L2513',
                           'L6521',
                           'M3462',
                           'P3635',
                           'S6262',
                           'T134'))
  AND (ci.note IN ('(audience page)',
                   '(office production assistant)',
                   '(production coordinator)')
       OR ci.note IS NULL)
  AND rt.role IN ('actress',
                   'composer',
                   'miscellaneous crew',
                   'production designer');