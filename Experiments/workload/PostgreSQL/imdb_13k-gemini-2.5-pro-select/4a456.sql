
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IS NULL
     AND (name_pcode_nf IN ('A4253',
                           'A6532',
                           'C6235',
                           'S3152',
                           'S3521')
          OR name_pcode_nf IS NULL)) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(deviser)',
                   '(producer)',
                   '(production assistant)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('34')) AS it1 ON pi1.info_type_id = it1.id;