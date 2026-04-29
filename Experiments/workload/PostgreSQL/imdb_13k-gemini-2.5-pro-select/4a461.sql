
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A5362',
                           'B5253',
                           'C624',
                           'H6431',
                           'J5363',
                           'O4163',
                           'P6252',
                           'S3631')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(voice)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('37')) AS it1 ON pi1.info_type_id = it1.id;