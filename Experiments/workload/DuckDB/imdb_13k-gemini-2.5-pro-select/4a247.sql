
SELECT COUNT(*)
FROM info_type AS it1
JOIN person_info AS pi1 ON it1.id = pi1.info_type_id
JOIN name AS n ON pi1.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE it1.id IN ('34')
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A3434',
                           'D1314',
                           'D1642',
                           'E25',
                           'F6262',
                           'G1623',
                           'G6263',
                           'H325',
                           'K4342',
                           'K6426',
                           'L262',
                           'M1426',
                           'P3624',
                           'P4',
                           'S5346'))
  AND (ci.note IN ('(celebrity producer)',
                   '(creator)',
                   '(director of photography)',
                   '(location manager)',
                   '(story)',
                   '(uncredited)',
                   '(writer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actress',
                   'cinematographer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer');