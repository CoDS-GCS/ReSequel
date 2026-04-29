
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
WHERE rt.role IN ('actor',
                   'cinematographer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND (ci.note IN ('(executive producer)',
                   '(overall in charge of promotion)',
                   '(writer)')
       OR ci.note IS NULL)
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A2356',
                           'A425',
                           'B6535',
                           'D134',
                           'G6243',
                           'J1616',
                           'J5236',
                           'J6253',
                           'M2426',
                           'R1634',
                           'R5436',
                           'S5256',
                           'T5236',
                           'T5245',
                           'T6162'))
  AND it1.id IN ('32');