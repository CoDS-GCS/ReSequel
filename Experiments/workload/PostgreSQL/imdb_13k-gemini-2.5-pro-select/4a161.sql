
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
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
                           'S3126')
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
       OR ci.note IS NULL)
  AND pi1.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('25'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('composer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer'));