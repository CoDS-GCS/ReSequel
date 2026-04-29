
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON rt.id = ci.role_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A41',
                           'A4256',
                           'A5236',
                           'E345',
                           'G4',
                           'G6431',
                           'J5216',
                           'K5165',
                           'K563',
                           'L4352',
                           'N2414',
                           'S415',
                           'S6212',
                           'X1632',
                           'Z4352'))
  AND (ci.note IN ('(adprom account head) (as Ivan Cruz)',
                   '(executive producer)',
                   '(head writer script)',
                   '(international marketing and distribution)',
                   '(production assistant)',
                   '(voice: Japanese version)',
                   '(written by) (as Janice Ferri Esser)',
                   '(written by)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'writer'))
  AND (it1.id IN ('34'));