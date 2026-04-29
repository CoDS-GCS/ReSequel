
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE (gender IN ('f')
          OR gender IS NULL)
     AND (name_pcode_nf IN ('B6161',
                           'J5165',
                           'K3654',
                           'L6525',
                           'M6234',
                           'M6241',
                           'M6265',
                           'N2425')
          OR name_pcode_nf IS NULL)) AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress',
                   'editor')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('26')) AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE ci.note IS NULL;