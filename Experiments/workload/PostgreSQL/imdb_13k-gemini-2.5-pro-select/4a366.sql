
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('C4625',
                           'E4546',
                           'F3624',
                           'G5432',
                           'G6231',
                           'H3653',
                           'H6323',
                           'I352',
                           'J5125',
                           'L2642',
                           'L626',
                           'M2425',
                           'P3653',
                           'R2632',
                           'S3152',
                           'T534',
                           'T6523',
                           'V2346',
                           'V4656')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(executive producer)',
                   '(producer)',
                   '(series creator)',
                   '(writer)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'actress',
                   'director',
                   'producer',
                   'writer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('32')) AS it1 ON pi1.info_type_id = it1.id;