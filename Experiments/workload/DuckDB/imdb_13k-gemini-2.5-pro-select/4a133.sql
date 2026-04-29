WITH name_an AS
  (SELECT n.id AS person_id
   FROM name AS n
   JOIN aka_name AS an ON n.id = an.person_id
   WHERE n.gender IS NULL
     AND n.name_pcode_nf IN ('A4526',
                           'A5362',
                           'B6524',
                           'B6535',
                           'C6426',
                           'G6212',
                           'R1632')),
     name_an_pi AS
  (SELECT na.person_id
   FROM name_an AS na
   JOIN person_info AS pi1 ON na.person_id = pi1.person_id
   JOIN info_type AS it1 ON pi1.info_type_id = it1.id
   WHERE it1.id IN ('22'))
SELECT COUNT(*)
FROM name_an_pi AS napi
JOIN cast_info AS ci ON napi.person_id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE rt.role IN ('director',
                   'miscellaneous crew',
                   'producer')
  AND (ci.note IN ('(producer)',
                   '(production assistant)')
       OR ci.note IS NULL);