
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('A1341',
                           'F3536',
                           'I5253',
                           'J2165',
                           'J3252',
                           'L6214',
                           'L6532',
                           'N6216',
                           'R1461',
                           'R6526',
                           'S3412',
                           'T5351',
                           'W63')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(as Larry Blake)',
                   '(creator)',
                   '(voice: English version) (as Judson L. Jones)',
                   '(written by)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'actress',
                   'composer',
                   'director',
                   'editor',
                   'writer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('22')) AS it1 ON pi1.info_type_id = it1.id;