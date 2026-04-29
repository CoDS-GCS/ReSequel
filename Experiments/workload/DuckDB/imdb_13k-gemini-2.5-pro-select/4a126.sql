
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('D3625',
                           'J152',
                           'J1621',
                           'M2452',
                           'O6254',
                           'P4135',
                           'S3452',
                           'S352',
                           'S353',
                           'S5262',
                           'Y2525')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(as Sid Hickox)',
                   '(executive producer)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'cinematographer',
                   'director',
                   'producer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('19')) AS it1 ON pi1.info_type_id = it1.id;