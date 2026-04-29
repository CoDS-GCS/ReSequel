WITH name_an AS
  (SELECT n.id AS person_id
   FROM name AS n
   JOIN aka_name AS an ON n.id = an.person_id
   WHERE n.gender IS NULL
     AND n.name_pcode_nf IN ('C6432',
                           'D3635',
                           'D5416',
                           'D5463',
                           'E2525',
                           'G2312',
                           'G6532',
                           'J1625',
                           'J236',
                           'J4536',
                           'J6265',
                           'J6526',
                           'K5252',
                           'K5362',
                           'K6235',
                           'L2364',
                           'L2452',
                           'M4532',
                           'M6235',
                           'M625',
                           'P3656',
                           'S3151',
                           'S53',
                           'U6241',
                           'W5352')),
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
WHERE rt.role IN ('cinematographer',
                   'composer',
                   'costume designer',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
  AND (ci.note IN ('(assistant producer)',
                   '(coordinating producer)',
                   '(designer)',
                   '(executive producer)',
                   '(line producer)',
                   '(location manager)',
                   '(mcr production assistant)',
                   '(other crew)',
                   '(producer)',
                   '(producer: Sotsû Agency)',
                   '(production accountant)',
                   '(production assistant)',
                   '(script supervisor) (as Les Hoyle)',
                   '(script supervisor)',
                   '(stage manager)',
                   '(writer)')
       OR ci.note IS NULL);