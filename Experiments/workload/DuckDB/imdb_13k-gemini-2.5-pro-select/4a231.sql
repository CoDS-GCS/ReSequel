
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('A1412',
                           'A3531',
                           'A3626',
                           'A4516',
                           'B3563',
                           'B6325',
                           'C6452',
                           'D6142',
                           'J1625',
                           'J3512',
                           'K4165',
                           'L531',
                           'P42',
                           'P6152',
                           'R5252',
                           'S4145',
                           'T5235',
                           'X1656',
                           'Y1512')
  AND (ci.note IN ('(executive producer)',
                   '(producer)',
                   '(production assistant)',
                   '(switcher)',
                   '(uncredited)',
                   '(written by)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'actress',
                   'composer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('31');