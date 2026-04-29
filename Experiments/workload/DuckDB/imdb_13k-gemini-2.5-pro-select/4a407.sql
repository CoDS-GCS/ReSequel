
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE rt.role IN ('actress',
                   'miscellaneous crew')
  AND it1.id IN ('22')
  AND n.gender IN ('f')
  AND n.name_pcode_nf IN ('A24',
                           'C464',
                           'C6451',
                           'E6264',
                           'E6563',
                           'G2414',
                           'J5165',
                           'L231',
                           'L5421',
                           'M2426',
                           'P6416',
                           'S1263',
                           'S6454',
                           'T612',
                           'Y5232')
  AND (ci.note IN ('(assistant: Glen & Les Charles)',
                   '(credit only)',
                   '(voice)')
       OR ci.note IS NULL);