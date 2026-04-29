WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A3531',
                           'A4123',
                           'A5352',
                           'A5361',
                           'A5624',
                           'B6516',
                           'C6216',
                           'D1321',
                           'G6241',
                           'J1242',
                           'J531',
                           'K5453',
                           'O4163',
                           'P1516',
                           'P43',
                           'P4524',
                           'R1652',
                           'R2626',
                           'S5262',
                           'T6254')),
     filtered_roles AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'cinematographer',
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
WHERE it1.id IN ('22')
  AND (ci.note IN ('(executive producer)',
                   '(producer)',
                   '(production assistant)',
                   '(talent coordinator)',
                   '(uncredited)',
                   '(writer)',
                   '(written by)')
       OR ci.note IS NULL);