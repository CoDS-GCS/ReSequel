WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('B6526',
                           'C6165',
                           'D56',
                           'F6341',
                           'J2',
                           'M4342',
                           'M5612',
                           'S3126',
                           'T6545')),
     filtered_roles AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'composer',
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
WHERE it1.id IN ('31')
  AND (ci.note IN ('(additional story material)',
                   '(creator)',
                   '(original concept: ABS-CBN Content, Research and Development) (as Manny Buising)',
                   '(producer)',
                   '(writer)')
       OR ci.note IS NULL);