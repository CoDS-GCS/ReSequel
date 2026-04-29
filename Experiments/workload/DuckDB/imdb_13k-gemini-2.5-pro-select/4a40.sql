WITH name_an AS
  (SELECT n.id AS person_id
   FROM name AS n
   JOIN aka_name AS an ON n.id = an.person_id
   WHERE n.gender IS NULL
     AND n.name_pcode_nf IN ('C6252',
                           'D1616',
                           'D326',
                           'E6212',
                           'G6243',
                           'H4263',
                           'K6235',
                           'L6452',
                           'M6532',
                           'R1631',
                           'S2632',
                           'T3252')),
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
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND (ci.note IN ('(director of development)',
                   '(nurse)',
                   '(producer)',
                   '(production accountant)',
                   '(script supervisor)',
                   '(writer)')
       OR ci.note IS NULL);