
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE n.gender IN ('m')
  AND n.name_pcode_nf IN ('A1245',
                           'B5156',
                           'D265',
                           'D5426',
                           'E6456',
                           'F5362',
                           'F6525',
                           'J2426',
                           'J25',
                           'J262',
                           'J5124',
                           'J52',
                           'J56',
                           'J6251',
                           'L1615',
                           'L2426',
                           'L3162',
                           'M3243',
                           'P1652',
                           'P3625',
                           'S6216',
                           'T3153',
                           'W4231')
  AND (ci.note IN ('(as Pat Neely)',
                   '(as Welkett)',
                   '(co-executive producer)',
                   '(creator)',
                   '(executive story consultant) (as Earl Hamner)',
                   '(producer)',
                   '(technical supervisor)',
                   '(uncredited)',
                   '(voice)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'cinematographer',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('37');