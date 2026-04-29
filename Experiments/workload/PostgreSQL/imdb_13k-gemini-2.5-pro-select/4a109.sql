
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
WHERE rt.role IN ('actor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND (ci.note IN ('(co-executive producer)',
                   '(head writer)',
                   '(producer)',
                   '(production accountant)',
                   '(production assistant)')
       OR ci.note IS NULL)
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('C6524',
                           'D1313',
                           'H6145',
                           'J4562',
                           'M362',
                           'M6263',
                           'P3625',
                           'S4512',
                           'T3512',
                           'W434',
                           'W45'))
  AND it1.id IN ('26');