
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('B6316',
                           'E6214',
                           'G2312',
                           'J253',
                           'J5215',
                           'J5242',
                           'J5252',
                           'M6234',
                           'M624',
                           'M6252',
                           'P3625',
                           'T5241',
                           'T6162')) AS n
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
   WHERE id IN ('34')) AS it1 ON pi1.info_type_id = it1.id;