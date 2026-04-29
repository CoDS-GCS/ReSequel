
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A2352',
                           'A3432',
                           'B6341',
                           'E621',
                           'F6362',
                           'G2342',
                           'I12',
                           'J16',
                           'J562',
                           'K1541',
                           'P6125',
                           'S3162',
                           'S52')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(actors director)',
                   '(archive footage)',
                   '(creative manager)',
                   '(director of photography)',
                   '(planning)',
                   '(producer)',
                   '(series producer)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'cinematographer',
                   'composer',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'writer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('32')) AS it1 ON pi1.info_type_id = it1.id;