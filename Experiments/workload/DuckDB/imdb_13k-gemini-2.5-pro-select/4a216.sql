WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('B2423',
                           'C246',
                           'C6521',
                           'D5432',
                           'J2562',
                           'J523',
                           'J525',
                           'J6216',
                           'L5416',
                           'M6262',
                           'R3125',
                           'T2565',
                           'W4352',
                           'Z3521')),
     filtered_roles AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'actress',
                   'composer',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN aka_name AS an ON fn.id = an.person_id
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN filtered_roles AS fr ON ci.role_id = fr.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE it1.id IN ('34')
  AND (ci.note IN ('(archive footage)',
                   '(executive producer)',
                   '(production executive)',
                   '(writer)')
       OR ci.note IS NULL);