
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A6145',
                           'B6541',
                           'D5',
                           'D5435',
                           'J5234',
                           'K5362',
                           'K6423',
                           'L6125',
                           'M3152',
                           'M62',
                           'M6456',
                           'R5165',
                           'S6326',
                           'W4364',
                           'W5323'))
  AND (ci.note IN ('(as Tito Fernández)',
                   '(associate producer)',
                   '(executive producer)',
                   '(producer)',
                   '(production coordinator)',
                   '(supervising producer)',
                   '(writer)',
                   '(written by)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'cinematographer',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('32');