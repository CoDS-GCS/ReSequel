
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('A4163',
                           'A4253',
                           'A5325',
                           'B6165',
                           'C4163',
                           'E153',
                           'F3531',
                           'G4321',
                           'G5341',
                           'J2351',
                           'J2523',
                           'J545',
                           'L5',
                           'L6512',
                           'M2414',
                           'M32',
                           'M5314',
                           'N351',
                           'N4316',
                           'P3614',
                           'S245',
                           'S3154')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(archive footage)',
                   '(as Ally Fowler)',
                   '(associate producer)',
                   '(creator)',
                   '(developer)',
                   '(executive producer)',
                   '(presenter)',
                   '(producer)',
                   '(production coordinator)',
                   '(uncredited)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'actress',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'writer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('25')) AS it1 ON pi1.info_type_id = it1.id;