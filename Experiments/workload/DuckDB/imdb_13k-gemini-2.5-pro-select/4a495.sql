
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('B1243',
                           'H4263',
                           'L2132',
                           'L5324',
                           'P3621')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actress',
                   'director',
                   'writer')
  AND it1.id IN ('19')
  AND (ci.note IN ('(script revision)',
                   '(uncredited)')
       OR ci.note IS NULL);