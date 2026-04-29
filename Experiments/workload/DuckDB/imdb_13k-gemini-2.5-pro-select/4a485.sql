
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('34')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A5624',
                           'B6353',
                           'E235',
                           'E3214',
                           'E6252',
                           'H4263',
                           'I1561',
                           'J3616',
                           'J6562',
                           'K6523',
                           'L5342',
                           'L6365',
                           'P4524',
                           'P512',
                           'S1531',
                           'S2323',
                           'S2525',
                           'S5254',
                           'S6142',
                           'T3145',
                           'V216',
                           'Z3236'))
  AND (ci.note IN ('(adprom head) (as Eric Salut)',
                   '(assistant producer)',
                   '(clearance supervisor)',
                   '(creator)',
                   '(executive producer)',
                   '(producer)',
                   '(production coordinator)',
                   '(script supervisor)',
                   '(story)',
                   '(writer)')
       OR ci.note IS NULL);