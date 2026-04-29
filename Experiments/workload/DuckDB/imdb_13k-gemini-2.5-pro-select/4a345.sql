WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('B6262',
                           'D1312',
                           'D362',
                           'D5425',
                           'H613',
                           'H6316',
                           'J252',
                           'J2526',
                           'J5134',
                           'K2361',
                           'L2',
                           'L2512',
                           'L6263',
                           'M2415',
                           'M6323',
                           'O3652',
                           'S4351',
                           'U3456')),
     filtered_roles AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'writer'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN aka_name AS an ON fn.id = an.person_id
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN filtered_roles AS fr ON ci.role_id = fr.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE it1.id IN ('37')
  AND (ci.note IN ('(archive footage)',
                   '(co-executive producer)',
                   '(producer)',
                   '(production executive)',
                   '(uncredited)',
                   '(voice)',
                   '(writer)')
       OR ci.note IS NULL);