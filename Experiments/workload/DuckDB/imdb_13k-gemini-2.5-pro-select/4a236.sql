WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A6241',
                           'C6423',
                           'C6426',
                           'J25',
                           'N56',
                           'P4656',
                           'T6236',
                           'W4525',
                           'W5252',
                           'Z6516')),
     filtered_roles AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'director',
                   'producer'))
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
                   '(voice)')
       OR ci.note IS NULL);