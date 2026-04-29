
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('C4342',
                           'C545',
                           'D162',
                           'E1625',
                           'E3215',
                           'E4216',
                           'G5362',
                           'J1612',
                           'J5151',
                           'J5164',
                           'J565',
                           'K1532',
                           'L143',
                           'L4316',
                           'M3162',
                           'M6232',
                           'P3625',
                           'S521',
                           'T4165',
                           'Y232',
                           'Z6526'))
  AND (ci.note IN ('(executive producer: RTL)',
                   '(linguistics consultant)',
                   '(producer)',
                   '(production assistant)',
                   '(production estimator)',
                   '(publicist)',
                   '(segment producer)',
                   '(story)',
                   '(uncredited)',
                   '(writer)',
                   '(written by)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
  AND it1.id IN ('19');