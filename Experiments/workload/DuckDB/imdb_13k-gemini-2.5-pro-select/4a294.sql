
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('A6362',
                           'C514',
                           'D253',
                           'H412',
                           'J512',
                           'J5164',
                           'L362',
                           'M2451',
                           'M3216',
                           'M6216',
                           'N2141',
                           'P3512',
                           'S1546',
                           'T4612',
                           'T5264',
                           'T56',
                           'T561')
  AND (ci.note IN ('(archive footage)',
                   '(as Marisa Perez)',
                   '(executive producer)',
                   '(producer)',
                   '(production coordinator)',
                   '(supervising producer)',
                   '(voice)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'actress',
                   'composer',
                   'director',
                   'miscellaneous crew',
                   'producer')
  AND it1.id IN ('19');