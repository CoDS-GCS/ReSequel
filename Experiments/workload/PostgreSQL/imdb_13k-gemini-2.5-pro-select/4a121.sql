
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A5212',
                           'D524',
                           'D545',
                           'K1561',
                           'L5631',
                           'M565',
                           'N2425')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(press attache)',
                   '(producer)',
                   '(voice: Japanese version)',
                   '(writer)',
                   '(written by)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'writer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('37')) AS it1 ON pi1.info_type_id = it1.id;