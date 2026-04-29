
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON rt.id = ci.role_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A6561',
                           'B5326',
                           'D1326',
                           'D1523',
                           'D2453',
                           'D5245',
                           'D546',
                           'J2426',
                           'J2523',
                           'J561',
                           'K1624',
                           'L6216',
                           'L6536',
                           'M2431',
                           'M2525',
                           'M262',
                           'P3625',
                           'R2412',
                           'R2424',
                           'R5652',
                           'S5632',
                           'T532',
                           'T6132',
                           'W4526'))
  AND (ci.note IN ('(assistant producer)',
                   '(associate producer)',
                   '(co-producer)',
                   '(director of photography) (as William Jurgensen)',
                   '(executive producer) (as Rosselle Soldao)',
                   '(executive producer)',
                   '(producer)',
                   '(production coordinator)',
                   '(publicist)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actress',
                   'cinematographer',
                   'composer',
                   'costume designer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer'))
  AND (it1.id IN ('37'));