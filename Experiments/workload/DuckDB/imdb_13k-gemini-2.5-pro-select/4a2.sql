
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('25')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'actress',
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
  AND (n.name_pcode_nf IN ('A5342',
                           'B34',
                           'B431',
                           'C6425',
                           'E2623',
                           'J1656',
                           'J2352',
                           'J4656',
                           'J5',
                           'J6325',
                           'K353',
                           'L134',
                           'M2165',
                           'M2532',
                           'P3615',
                           'P423',
                           'T5252',
                           'W4536'))
  AND (ci.note IN ('(assistant producer)',
                   '(executive producer)',
                   '(production accountant)',
                   '(researcher)',
                   '(staff writer)',
                   '(voice)',
                   '(voice: English version)',
                   '(writer)',
                   '(written by)')
       OR ci.note IS NULL);