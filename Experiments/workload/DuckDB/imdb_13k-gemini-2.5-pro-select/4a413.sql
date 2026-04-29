
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A1623',
                           'A1652',
                           'A4521',
                           'C5254',
                           'D5424',
                           'D6435',
                           'E3265',
                           'G5635',
                           'G6312',
                           'G6435',
                           'K4265',
                           'K5452',
                           'L5363',
                           'M2345',
                           'N2525',
                           'O4216',
                           'O6453',
                           'P36',
                           'P3626',
                           'P41',
                           'P4252',
                           'R2523',
                           'S312',
                           'S4615',
                           'W345')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(creator)',
                   '(credit only)',
                   '(executive producer)',
                   '(producer)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'producer',
                   'writer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('25')) AS it1 ON pi1.info_type_id = it1.id;