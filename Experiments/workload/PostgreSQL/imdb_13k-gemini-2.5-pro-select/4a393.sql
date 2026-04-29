
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE rt.role IN ('actress',
                   'costume designer',
                   'miscellaneous crew')
  AND it1.id IN ('26')
  AND n.gender IN ('f')
  AND n.name_pcode_nf IN ('A51',
                           'A6453',
                           'D1652',
                           'D5426',
                           'E3426',
                           'J2514',
                           'J3123',
                           'L624',
                           'L6541',
                           'M243',
                           'M2436',
                           'N5261',
                           'R2162',
                           'S4351',
                           'S6525',
                           'T2325')
  AND (ci.note IN ('(actors director)',
                   '(as Jutta Unterlercher)')
       OR ci.note IS NULL);