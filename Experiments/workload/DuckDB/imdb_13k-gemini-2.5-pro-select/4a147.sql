WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('B3563',
                           'B5252',
                           'C3653',
                           'C6421',
                           'C6545',
                           'D6524',
                           'E3525',
                           'E4565',
                           'G5263',
                           'H3523',
                           'H3652',
                           'J3243',
                           'L2163',
                           'M2523',
                           'R2531',
                           'R512',
                           'S1525',
                           'S5323'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON fn.id = an.person_id
WHERE rt.role IN ('actress',
                   'miscellaneous crew',
                   'producer')
  AND it1.id IN ('32')
  AND (ci.note IN ('(executive producer)',
                   '(talent coordinator) (as Cornelia Lee)',
                   '(voice)')
       OR ci.note IS NULL);