
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('A4521',
                           'A5416',
                           'A6453',
                           'B6516',
                           'C2563',
                           'C6421',
                           'D5235',
                           'H5243',
                           'H5634',
                           'J134',
                           'J213',
                           'J2352',
                           'J2542',
                           'J6251',
                           'K6236',
                           'L2146',
                           'L423',
                           'L5645',
                           'L6525',
                           'M6343',
                           'M6362',
                           'M6523',
                           'N35',
                           'P3642')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(executive producer)',
                   '(producer)',
                   '(producer: FUNimation)',
                   '(supervising producer)',
                   '(voice: English version)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'actress',
                   'director',
                   'producer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('22')) AS it1 ON pi1.info_type_id = it1.id;