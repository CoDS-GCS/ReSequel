
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('37')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'actress',
                   'composer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A4163',
                           'B5324',
                           'C3235',
                           'C4132',
                           'C5235',
                           'E3263',
                           'E3562',
                           'G315',
                           'J5243',
                           'J5423',
                           'J5656',
                           'M653',
                           'N5362',
                           'P4526',
                           'V2365'))
  AND (ci.note IN ('(producer: studio)',
                   '(production assistant)',
                   '(script supervisor)',
                   '(senior story editor)',
                   '(teleplay)',
                   '(uncredited)',
                   '(written by)')
       OR ci.note IS NULL);