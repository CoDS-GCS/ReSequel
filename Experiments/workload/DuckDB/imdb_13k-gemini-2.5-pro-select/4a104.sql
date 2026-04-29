
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('19')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
                   'cinematographer',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A5242',
                           'B6231',
                           'B6316',
                           'E1356',
                           'E2345',
                           'E4215',
                           'E5425',
                           'G6352',
                           'H6532',
                           'J5136',
                           'J5165',
                           'K6526',
                           'L2143',
                           'L6365',
                           'P3246',
                           'P3621',
                           'S4564',
                           'S5262',
                           'T5242'))
  AND (ci.note IN ('(contributing writer)',
                   '(director of photography)',
                   '(production assistant)',
                   '(supervising producer)',
                   '(writer)')
       OR ci.note IS NULL);