
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('B5252',
                           'B6234',
                           'D2152',
                           'F6234',
                           'J2451',
                           'L6241',
                           'M3532',
                           'M421',
                           'M6525',
                           'M6562',
                           'N6516',
                           'O4252',
                           'R1453',
                           'R5415',
                           'S2125',
                           'S2624',
                           'V3656',
                           'W6564',
                           'Z25')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(actors director)',
                   '(developed for television by)',
                   '(executive producer)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'actress',
                   'miscellaneous crew',
                   'producer',
                   'writer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('25')) AS it1 ON pi1.info_type_id = it1.id;