
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('G5245',
                           'H5215',
                           'H623',
                           'I3215',
                           'K4342',
                           'M6231',
                           'M6414',
                           'N1325',
                           'R53',
                           'S245',
                           'S3653',
                           'T143',
                           'Y251',
                           'Z2531')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(executive producer)',
                   '(talent coordinator)',
                   '(voice) (uncredited)',
                   '(voice)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'actress',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('32')) AS it1 ON pi1.info_type_id = it1.id;