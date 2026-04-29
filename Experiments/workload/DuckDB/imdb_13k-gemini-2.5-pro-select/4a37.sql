WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('C4523',
                           'D1326',
                           'G4253',
                           'G4531',
                           'G6345',
                           'H653',
                           'J232',
                           'J2524',
                           'J2625',
                           'J5165',
                           'J525',
                           'K535',
                           'K6421',
                           'L2436',
                           'M25',
                           'P3626',
                           'P5342',
                           'S1235',
                           'S6562')),
     filtered_roles AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN aka_name AS an ON fn.id = an.person_id
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN filtered_roles AS fr ON ci.role_id = fr.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE it1.id IN ('32')
  AND (ci.note IN ('(actors director)',
                   '(archive footage)',
                   '(producer)',
                   '(uncredited)')
       OR ci.note IS NULL);