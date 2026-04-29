
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('A5325',
                           'B1236',
                           'B41',
                           'C6425',
                           'D236',
                           'F6516',
                           'I5231',
                           'J2356',
                           'M262',
                           'S3125')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(associate producer)',
                   '(creative consultant) (as Atty. Annette Gozon-Abrogar)',
                   '(producer)',
                   '(production assistant)',
                   '(uncredited)',
                   '(voice)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'actress',
                   'miscellaneous crew',
                   'producer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('22')) AS it1 ON pi1.info_type_id = it1.id;