WITH name_an AS
  (SELECT n.id AS person_id
   FROM name AS n
   JOIN aka_name AS an ON n.id = an.person_id
   WHERE n.gender IS NULL
     AND n.name_pcode_nf IN ('A425',
                           'A5352',
                           'A5365',
                           'C6231',
                           'D1324',
                           'D1326',
                           'D1362',
                           'D5216',
                           'D6431',
                           'E3631',
                           'G6263',
                           'K3252',
                           'R1635',
                           'S252',
                           'S2652',
                           'S3154')),
     name_an_pi AS
  (SELECT na.person_id
   FROM name_an AS na
   JOIN person_info AS pi1 ON na.person_id = pi1.person_id
   JOIN info_type AS it1 ON pi1.info_type_id = it1.id
   WHERE it1.id IN ('37'))
SELECT COUNT(*)
FROM name_an_pi AS napi
JOIN cast_info AS ci ON napi.person_id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE rt.role IN ('director',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
  AND (ci.note IN ('(associate producer)',
                   '(copying & shipping)',
                   '(executive producer)',
                   '(first assistant accountant) (uncredited)',
                   '(producer)',
                   '(production assistant)',
                   '(production staff)',
                   '(script supervisor)',
                   '(writer)')
       OR ci.note IS NULL);