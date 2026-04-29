
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('22')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
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
  AND (n.name_pcode_nf IN ('A4253',
                           'C25',
                           'C4323',
                           'C5456',
                           'C6423',
                           'C6424',
                           'D132',
                           'H42',
                           'J4562',
                           'J5241',
                           'J6315',
                           'K5164',
                           'K53',
                           'N526',
                           'N562',
                           'O4134',
                           'R2626',
                           'R5432',
                           'S51'))
  AND (ci.note IN ('(line producer)',
                   '(producer)',
                   '(vice president of development)',
                   '(writer)')
       OR ci.note IS NULL);