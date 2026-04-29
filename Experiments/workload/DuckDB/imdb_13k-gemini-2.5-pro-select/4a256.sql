
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
WHERE rt.role IN ('actor',
                   'cinematographer',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND (ci.note IN ('(creator)',
                   '(executive producer)',
                   '(producer)',
                   '(production assistant)',
                   '(production cost accountant) (as Me-ann Maluya)',
                   '(senior segment producer)',
                   '(story)',
                   '(uncredited)')
       OR ci.note IS NULL)
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A2356',
                           'A5351',
                           'B132',
                           'B6324',
                           'D526',
                           'D563',
                           'G6352',
                           'I6152',
                           'J1626',
                           'J2',
                           'J5265',
                           'J6243',
                           'K5351',
                           'L2416',
                           'M54',
                           'R1352',
                           'R2616',
                           'S562',
                           'T1423',
                           'T5342'))
  AND it1.id IN ('32');