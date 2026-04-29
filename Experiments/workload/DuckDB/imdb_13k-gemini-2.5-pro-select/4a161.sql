WITH name_an AS
  (SELECT n.id AS person_id
   FROM name AS n
   JOIN aka_name AS an ON n.id = an.person_id
   WHERE n.gender IS NULL
     AND n.name_pcode_nf IN ('A4216',
                           'C6214',
                           'C6416',
                           'D1362',
                           'E6252',
                           'J2126',
                           'J2456',
                           'J5264',
                           'J6531',
                           'M2414',
                           'M2432',
                           'M5214',
                           'M6252',
                           'M6262',
                           'P3616',
                           'P4232',
                           'R2623',
                           'S3126')),
     name_an_pi AS
  (SELECT na.person_id
   FROM name_an AS na
   JOIN person_info AS pi1 ON na.person_id = pi1.person_id
   JOIN info_type AS it1 ON pi1.info_type_id = it1.id
   WHERE it1.id IN ('25'))
SELECT COUNT(*)
FROM name_an_pi AS napi
JOIN cast_info AS ci ON napi.person_id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE rt.role IN ('composer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND (ci.note IN ('(adprom head)',
                   '(as John Parker)',
                   '(assistant producer)',
                   '(crowd control)',
                   '(executive producer)',
                   '(field intern) (uncredited)',
                   '(main composer) (as M. L. A.)',
                   '(post production coordinator)',
                   '(producer)',
                   '(production assistant)',
                   '(script supervisor)',
                   '(writer)',
                   '(written by)')
       OR ci.note IS NULL);