
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('A5162',
                           'C5165',
                           'D5263',
                           'E2152',
                           'F5152',
                           'G5415',
                           'G5453',
                           'J6135',
                           'L465',
                           'N6',
                           'P3626',
                           'R2343',
                           'S2526',
                           'S5252',
                           'Z426')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actress',
                   'editor',
                   'producer')
  AND it1.id IN ('31')
  AND (ci.note IN ('(co-executive producer) (as Suzy Mamann Greenberg)',
                   '(voice)')
       OR ci.note IS NULL);