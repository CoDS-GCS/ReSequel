
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('A4253',
                           'B2632',
                           'C342',
                           'E3532',
                           'H4142',
                           'J2563',
                           'K5321',
                           'P3625',
                           'P6121',
                           'R2425',
                           'R2525',
                           'R2632',
                           'S3126',
                           'S3616',
                           'T25',
                           'T5231')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(credit only)',
                   '(executive producer) (uncredited)',
                   '(location manager)',
                   '(producer)',
                   '(production coordinator)',
                   '(senior coordinating producer)',
                   '(uncredited)',
                   '(voice: Japanese version)',
                   '(written by)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'actress',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('25')) AS it1 ON pi1.info_type_id = it1.id;