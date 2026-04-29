WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A6536',
                           'B1252',
                           'C6423',
                           'F4351',
                           'G6243',
                           'G6353',
                           'H5141',
                           'J5132',
                           'J52',
                           'L5436',
                           'P4626',
                           'W4526')),
     filtered_roles AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'director',
                   'producer',
                   'writer'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN aka_name AS an ON fn.id = an.person_id
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN filtered_roles AS fr ON ci.role_id = fr.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE it1.id IN ('31')
  AND (ci.note IN ('(associate producer)',
                   '(creator)',
                   '(producer)',
                   '(studio)',
                   '(uncredited)')
       OR ci.note IS NULL);