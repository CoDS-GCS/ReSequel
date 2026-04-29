
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('25')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A4354',
                           'D5654',
                           'G6345',
                           'J6316',
                           'J6524',
                           'M1536',
                           'M241',
                           'M32',
                           'S2316',
                           'V2412'))
  AND (ci.note IN ('(creator)',
                   '(executive producer)',
                   '(technical manager)',
                   '(voice)')
       OR ci.note IS NULL);