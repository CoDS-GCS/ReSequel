
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('A4252',
                           'D1562',
                           'I5216',
                           'K2532',
                           'K3214',
                           'K3525',
                           'L4653',
                           'M525',
                           'M5426',
                           'M6261',
                           'N24',
                           'N3262',
                           'R2153')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actress')
  AND it1.id IN ('22')
  AND (ci.note IN ('(uncredited)')
       OR ci.note IS NULL);