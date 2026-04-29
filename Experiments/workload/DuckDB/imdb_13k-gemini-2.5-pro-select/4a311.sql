WITH name_an AS
  (SELECT n.id AS person_id
   FROM name AS n
   JOIN aka_name AS an ON n.id = an.person_id
   WHERE n.gender IS NULL
     AND n.name_pcode_nf IN ('D5215',
                           'D5454',
                           'I4231',
                           'J524',
                           'R1516',
                           'R2435',
                           'S2324',
                           'S5253',
                           'S5254')),
     name_an_pi AS
  (SELECT na.person_id
   FROM name_an AS na
   JOIN person_info AS pi1 ON na.person_id = pi1.person_id
   JOIN info_type AS it1 ON pi1.info_type_id = it1.id
   WHERE it1.id IN ('26'))
SELECT COUNT(*)
FROM name_an_pi AS napi
JOIN cast_info AS ci ON napi.person_id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE rt.role IN ('composer',
                   'costume designer',
                   'director',
                   'miscellaneous crew')
  AND (ci.note IN ('(on-set tutor) (as Rachel Graham)',
                   '(production accountant)',
                   '(production assistant)',
                   '(script coordinator)',
                   '(unit assistant)')
       OR ci.note IS NULL);