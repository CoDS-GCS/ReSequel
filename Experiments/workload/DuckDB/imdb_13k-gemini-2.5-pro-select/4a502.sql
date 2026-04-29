
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('32')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'actress',
                   'composer',
                   'miscellaneous crew',
                   'producer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A3462',
                           'A5462',
                           'C6252',
                           'D524',
                           'E2364',
                           'E3523',
                           'K5342',
                           'M5325',
                           'P3623',
                           'P4162',
                           'P4234',
                           'R236',
                           'S1625',
                           'S3135',
                           'Y2'))
  AND (ci.note IN ('(co-producer)',
                   '(coordinating producer) (as Kendall E. Canner)',
                   '(creator)',
                   '(original picture)',
                   '(series producer)',
                   '(voice)',
                   '(writer)')
       OR ci.note IS NULL);