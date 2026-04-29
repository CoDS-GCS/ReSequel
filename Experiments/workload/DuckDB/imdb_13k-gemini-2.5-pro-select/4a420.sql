WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('A2524',
                           'A5126',
                           'B25',
                           'C452',
                           'E352',
                           'E6214',
                           'E6242',
                           'F6231',
                           'G3236',
                           'G5346',
                           'H412',
                           'J2315',
                           'J4156',
                           'J5253',
                           'L3243',
                           'L4352',
                           'L4535',
                           'M2635',
                           'N1215',
                           'S5242',
                           'T1323',
                           'V6345')),
     filtered_roles AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress',
                   'producer'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN aka_name AS an ON fn.id = an.person_id
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN filtered_roles AS fr ON ci.role_id = fr.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE it1.id IN ('22')
  AND (ci.note IN ('(producer)',
                   '(voice)')
       OR ci.note IS NULL);