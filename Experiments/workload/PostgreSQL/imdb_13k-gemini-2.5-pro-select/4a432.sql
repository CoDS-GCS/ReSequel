
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('A23',
                           'B4236',
                           'B4246',
                           'D2525',
                           'E4525',
                           'E6515',
                           'F4216',
                           'G342',
                           'H3246',
                           'J3615',
                           'J513',
                           'L2165',
                           'L3264',
                           'L5256',
                           'O3165',
                           'S3',
                           'S6454',
                           'W54')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(idea) (uncredited)',
                   '(uncredited)',
                   '(voice)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress',
                   'director',
                   'writer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('25')) AS it1 ON pi1.info_type_id = it1.id;