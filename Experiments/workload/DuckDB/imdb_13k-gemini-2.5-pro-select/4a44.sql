
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A562',
                           'A6321',
                           'D6362',
                           'G6236',
                           'J1563',
                           'N36',
                           'R2151',
                           'R523',
                           'S5232',
                           'W4363'))
  AND (ci.note IN ('(adprom coordinator)',
                   '(consultant writer)',
                   '(executive producer)',
                   '(producer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('31');