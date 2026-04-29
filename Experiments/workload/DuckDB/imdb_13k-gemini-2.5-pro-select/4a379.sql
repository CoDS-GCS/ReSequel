
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('37')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
                   'cinematographer',
                   'composer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A5345',
                           'B5253',
                           'C6525',
                           'D2315',
                           'D5141',
                           'F6525',
                           'G5432',
                           'H3',
                           'J4212',
                           'J5326',
                           'K1525',
                           'L6261',
                           'M1',
                           'R5463',
                           'S2514',
                           'S314',
                           'S5242',
                           'S5632',
                           'T6153',
                           'V6521'))
  AND (ci.note IN ('(credit only) (as Frances Makil-Ignacio)',
                   '(edited by)',
                   '(executive producer)',
                   '(payroll accountant) (uncredited)',
                   '(producer)',
                   '(production assistant)',
                   '(screenplay)')
       OR ci.note IS NULL);