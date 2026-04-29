
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('A3451',
                           'E1463',
                           'E4325',
                           'E6213',
                           'F6312',
                           'J2163',
                           'J5165',
                           'K324',
                           'L4256',
                           'M5323',
                           'M6364',
                           'M6426',
                           'M6454',
                           'N163',
                           'P3621',
                           'S5415',
                           'X52')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(as Dr. Joyce Brothers)',
                   '(as Mariel)',
                   '(associate producer)',
                   '(producer)',
                   '(voice)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress',
                   'costume designer',
                   'producer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('37')) AS it1 ON pi1.info_type_id = it1.id;