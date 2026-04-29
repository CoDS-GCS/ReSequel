
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A2425',
                           'B4',
                           'C6165',
                           'D1362',
                           'D5434',
                           'E3523',
                           'F6525',
                           'J2152',
                           'J512',
                           'K5256',
                           'M242',
                           'M3514',
                           'M4325',
                           'N243',
                           'R1635',
                           'R2412',
                           'R2424',
                           'R5241',
                           'S2163',
                           'S5236',
                           'S5242',
                           'S5253',
                           'S6241',
                           'T525',
                           'T5261'))
  AND (ci.note IN ('(as Joe Mascolo)',
                   '(executive producer)',
                   '(production assistant)',
                   '(technical director)',
                   '(written by)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'actress',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('22');