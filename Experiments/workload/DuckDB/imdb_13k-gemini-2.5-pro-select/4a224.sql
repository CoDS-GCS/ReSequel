WITH name_an AS
  (SELECT n.id AS person_id
   FROM name AS n
   JOIN aka_name AS an ON n.id = an.person_id
   WHERE n.gender IS NULL
     AND n.name_pcode_nf IN ('A425',
                           'B415',
                           'D1324',
                           'D1616',
                           'D5415',
                           'D5425',
                           'H432',
                           'J254',
                           'J5125',
                           'J5232',
                           'J5253',
                           'J562',
                           'L245',
                           'L253',
                           'L6236',
                           'M23',
                           'M253',
                           'N2426',
                           'P4523',
                           'R2621',
                           'S2626',
                           'S3542',
                           'S6562')),
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
WHERE rt.role IN ('cinematographer',
                   'composer',
                   'costume designer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
  AND (ci.note IN ('(as Shyra Joaquin)',
                   '(associate head writer)',
                   '(creator)',
                   '(executive producer)',
                   '(key craft service) (uncredited)',
                   '(producer)',
                   '(production assistant)',
                   '(production coordinator)',
                   '(series producer)')
       OR ci.note IS NULL);