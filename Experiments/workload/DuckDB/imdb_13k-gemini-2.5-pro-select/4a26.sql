WITH name_an AS
  (SELECT n.id AS person_id
   FROM name AS n
   JOIN aka_name AS an ON n.id = an.person_id
   WHERE n.gender IS NULL
     AND n.name_pcode_nf IN ('B42',
                           'B6232',
                           'F6523',
                           'H5624',
                           'J2423',
                           'J25',
                           'J4524',
                           'J4536',
                           'M24',
                           'M412',
                           'M6265',
                           'M6565',
                           'O6453',
                           'P3612',
                           'P362',
                           'R2316',
                           'S6452',
                           'T6252',
                           'W4525')),
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
WHERE rt.role IN ('cinematographer',
                   'costume designer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND (ci.note IN ('(adaptation)',
                   '(creator)',
                   '(executive producer)',
                   '(mcr production assistant)',
                   '(producer)',
                   '(production assistant)',
                   '(production controller)',
                   '(production intern)',
                   '(writer)')
       OR ci.note IS NULL);