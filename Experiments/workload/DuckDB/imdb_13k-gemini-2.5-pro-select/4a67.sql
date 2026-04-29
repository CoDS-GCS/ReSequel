
SELECT COUNT(*)
FROM info_type AS it1
JOIN person_info AS pi1 ON it1.id = pi1.info_type_id
JOIN name AS n ON pi1.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE it1.id IN ('34')
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A5365',
                           'B6531',
                           'I6525',
                           'J2516',
                           'K53',
                           'N2426',
                           'N5165',
                           'N6523',
                           'R1214',
                           'R2632',
                           'S1536',
                           'Y523',
                           'Y5252'))
  AND (ci.note IN ('(copying & shipping)',
                   '(head writer story)',
                   '(line producer)',
                   '(producer)',
                   '(production secretary)',
                   '(story)')
       OR ci.note IS NULL)
  AND rt.role IN ('actress',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'writer');