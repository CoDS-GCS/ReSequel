WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('B2416',
                           'D5262',
                           'E2562',
                           'G65',
                           'K3652',
                           'M2145',
                           'M6316',
                           'S1653',
                           'S415',
                           'T2516',
                           'V6314')),
     filtered_roles AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress',
                   'costume designer',
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
  AND (ci.note IN ('(as Mirtha Ibarra)',
                   '(as Teagan)',
                   '(executive producer)',
                   '(nucleus director)',
                   '(writer)')
       OR ci.note IS NULL);