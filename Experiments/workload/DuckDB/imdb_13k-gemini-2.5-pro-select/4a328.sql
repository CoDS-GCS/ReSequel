
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
  AND (n.name_pcode_nf IN ('E126',
                           'G523',
                           'J3546',
                           'J5256',
                           'K261',
                           'K2632',
                           'P4142',
                           'P5324',
                           'P6252',
                           'R5126',
                           'S563',
                           'T545'))
  AND (ci.note IN ('(location manager) (as Timothy Hillman)',
                   '(production assistant)',
                   '(senior executive)',
                   '(voice)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'actress',
                   'composer',
                   'director',
                   'editor',
                   'miscellaneous crew')
  AND it1.id IN ('34');