
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('26')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('C4563',
                           'D6215',
                           'D624',
                           'J524',
                           'J6523',
                           'K346',
                           'M3236',
                           'P4532',
                           'T5253',
                           'W4542'))
  AND (ci.note IN ('(executive producer: BBC)',
                   '(producer)',
                   '(production assistant)',
                   '(stage manager)')
       OR ci.note IS NULL);