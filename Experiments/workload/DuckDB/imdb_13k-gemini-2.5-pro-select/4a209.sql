
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE n.gender IN ('m')
  AND n.name_pcode_nf IN ('A5362',
                           'B1536',
                           'B6216',
                           'D25',
                           'D5253',
                           'I5652',
                           'J5136',
                           'J5162',
                           'M2456',
                           'M5462',
                           'M6252',
                           'P364',
                           'R4143',
                           'R5626',
                           'T3263',
                           'T53')
  AND (ci.note IN ('(executive producer)',
                   '(script producer)',
                   '(uncredited)',
                   '(voice)',
                   '(written by)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'producer',
                   'writer')
  AND it1.id IN ('34');