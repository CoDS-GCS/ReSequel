WITH valid_persons AS
  (SELECT n.id
   FROM name AS n
   JOIN aka_name AS an ON n.id = an.person_id
   WHERE n.gender IN ('f')
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
                           'T2325'))
SELECT COUNT(*)
FROM valid_persons vp
JOIN cast_info ci ON vp.id = ci.person_id
JOIN role_type rt ON ci.role_id = rt.id
JOIN person_info pi1 ON vp.id = pi1.person_id
JOIN info_type it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actress',
                   'costume designer',
                   'miscellaneous crew')
  AND it1.id IN ('26')
  AND (ci.note IN ('(actors director)',
                   '(as Jutta Unterlercher)')
       OR ci.note IS NULL);