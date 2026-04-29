WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A6512',
                           'C246',
                           'D1323',
                           'F216',
                           'F6316',
                           'I1516',
                           'I5625',
                           'J2156',
                           'J262',
                           'J43',
                           'J5251',
                           'L42',
                           'M2413',
                           'N2436',
                           'P2426',
                           'R5153',
                           'R5452',
                           'S3632',
                           'S5361',
                           'T235',
                           'V5213')),
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
WHERE it1.id IN ('25')
  AND (ci.note IN ('(acting director)',
                   '(executive producer)',
                   '(producer)',
                   '(uncredited)',
                   '(voice)',
                   '(writer)')
       OR ci.note IS NULL);