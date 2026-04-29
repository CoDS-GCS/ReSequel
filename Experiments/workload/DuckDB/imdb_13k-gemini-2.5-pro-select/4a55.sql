
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A5352',
                           'C6256',
                           'D1351',
                           'H626',
                           'J16',
                           'J5616',
                           'L52',
                           'M2526',
                           'P3641',
                           'R1425')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actor',
                   'director')
  AND it1.id IN ('31')
  AND (ci.note IN ('(voice)')
       OR ci.note IS NULL);