
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('B6535',
                           'C2',
                           'C625',
                           'I5235',
                           'J1316',
                           'J2545',
                           'J2616',
                           'K1512',
                           'L2132',
                           'L5451',
                           'N1645',
                           'P3243',
                           'S632',
                           'T6235')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(as Naprey)',
                   '(associate producer)',
                   '(director of photography)',
                   '(executive producer)',
                   '(producer)',
                   '(script revision)',
                   '(uncredited)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'actress',
                   'cinematographer',
                   'miscellaneous crew',
                   'producer',
                   'writer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('34')) AS it1 ON pi1.info_type_id = it1.id;