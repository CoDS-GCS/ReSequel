
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IS NULL
     AND name_pcode_nf IN ('C6235',
                           'C6424',
                           'C6426',
                           'F6521',
                           'P3623',
                           'R1632',
                           'R2631')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('32')) AS it1 ON pi1.info_type_id = it1.id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('cinematographer',
                   'composer',
                   'director',
                   'editor',
                   'producer')) AS rt ON ci.role_id = rt.id
WHERE (ci.note IN ('(producer)')
       OR ci.note IS NULL);