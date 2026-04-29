
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('B6516',
                           'D2651',
                           'D5452',
                           'G6356',
                           'H524',
                           'J6121',
                           'J614',
                           'K35',
                           'L5235',
                           'O42',
                           'P4124',
                           'P5452',
                           'R2456',
                           'R3126',
                           'R362',
                           'R5124',
                           'S6562',
                           'T25',
                           'T52',
                           'V5232',
                           'W4364',
                           'Z3521'))
  AND (ci.note IN ('(co-producer)',
                   '(executive producer)',
                   '(producer)',
                   '(uncredited)',
                   '(video)',
                   '(voice)',
                   '(writer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'cinematographer',
                   'composer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('34');