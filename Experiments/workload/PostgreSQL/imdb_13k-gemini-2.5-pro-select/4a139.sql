
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('B6536',
                           'C2525',
                           'D2623',
                           'D535',
                           'E5425',
                           'E652',
                           'F632',
                           'G5242',
                           'H6323',
                           'H6326',
                           'K6465',
                           'L2621',
                           'N2561',
                           'O6424',
                           'R5654',
                           'S142')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(executive producer)',
                   '(writer)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'actress',
                   'composer',
                   'producer',
                   'writer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('37')) AS it1 ON pi1.info_type_id = it1.id;