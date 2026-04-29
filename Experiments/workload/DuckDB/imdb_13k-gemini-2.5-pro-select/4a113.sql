
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('D1323',
                           'E3632',
                           'F5352',
                           'J2426',
                           'J5312',
                           'L5435',
                           'R452')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actor',
                   'producer',
                   'writer')
  AND it1.id IN ('31')
  AND (ci.note IN ('(co-executive producer) (as Dave Goetsch)',
                   '(creator)',
                   '(executive producer)')
       OR ci.note IS NULL);