
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('A5165',
                           'C6234',
                           'E4562',
                           'F6525',
                           'G6325',
                           'L25',
                           'M5326',
                           'M6243',
                           'M6252',
                           'M652',
                           'R2562',
                           'S2525',
                           'V2362',
                           'V4535')) AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE ci.note IS NULL
  AND rt.role IN ('actress')
  AND it1.id IN ('19');