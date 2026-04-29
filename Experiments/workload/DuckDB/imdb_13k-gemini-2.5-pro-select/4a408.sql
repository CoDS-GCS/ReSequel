
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('B6212',
                           'C412',
                           'J5262',
                           'K5126',
                           'K5164',
                           'L5145',
                           'M1526',
                           'M2425',
                           'P2325',
                           'P3125',
                           'S5236',
                           'S6525',
                           'T1526',
                           'X52')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actress',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('26')
  AND (ci.note IN ('(archive footage)',
                   '(executive producer)',
                   '(story editor)',
                   '(uncredited)',
                   '(writer)')
       OR ci.note IS NULL);