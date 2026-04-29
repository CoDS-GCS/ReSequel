WITH name_an AS
  (SELECT n.id AS person_id
   FROM name AS n
   JOIN aka_name AS an ON n.id = an.person_id
   WHERE n.gender IS NULL
     AND n.name_pcode_nf IN ('A5352',
                           'B6563',
                           'D1312',
                           'D1352',
                           'E4213',
                           'J5163',
                           'J5253',
                           'J5426',
                           'L252',
                           'M6235',
                           'M6352',
                           'R2636',
                           'S3151')),
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
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
  AND (ci.note IN ('(assistant location manager)',
                   '(executive producer)',
                   '(medical consultant)',
                   '(production assistant)',
                   '(production coordinator)',
                   '(production secretary)')
       OR ci.note IS NULL);