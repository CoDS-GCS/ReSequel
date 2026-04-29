
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A5352',
                           'B6356',
                           'G4656',
                           'J2132',
                           'P1263',
                           'P3626')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actor',
                   'director')
  AND it1.id IN ('34')
  AND (ci.note IN ('(archive footage)',
                   '(uncredited)')
       OR ci.note IS NULL);