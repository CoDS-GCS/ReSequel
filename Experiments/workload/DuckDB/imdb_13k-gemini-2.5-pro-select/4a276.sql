
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
WHERE rt.role IN ('actor',
                   'cinematographer',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND (ci.note IN ('(producer)',
                   '(production assistant)',
                   '(voice)',
                   '(written by)')
       OR ci.note IS NULL)
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('E3632',
                           'E4214',
                           'H2635',
                           'J2535',
                           'M2162',
                           'M62',
                           'R2143',
                           'R4132',
                           'T231',
                           'T3525'))
  AND it1.id IN ('22');