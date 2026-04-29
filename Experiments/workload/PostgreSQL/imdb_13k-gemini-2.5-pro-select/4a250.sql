
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('25')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
                   'cinematographer',
                   'composer',
                   'costume designer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A1243',
                           'A4254',
                           'A5231',
                           'A5242',
                           'A5245',
                           'C23',
                           'C6215',
                           'D4163',
                           'D525',
                           'G6262',
                           'J5253',
                           'J5362',
                           'J5462',
                           'K6231',
                           'M245',
                           'M252',
                           'M6243',
                           'M6326',
                           'P5256',
                           'R1565',
                           'S1653',
                           'S6263',
                           'S6523'))
  AND (ci.note IN ('(Psychologist)',
                   '(associate producer)',
                   '(director of photography)',
                   '(executive producer)',
                   '(production assistant)',
                   '(production coordinator)',
                   '(production secretary)',
                   '(voice)')
       OR ci.note IS NULL);