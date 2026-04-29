
SELECT COUNT(*)
FROM name AS n
INNER JOIN aka_name AS an ON n.id = an.person_id
INNER JOIN person_info AS pi1 ON n.id = pi1.person_id
INNER JOIN cast_info AS ci ON n.id = ci.person_id
INNER JOIN role_type AS rt ON ci.role_id = rt.id
INNER JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A6364',
                           'B6252',
                           'E3634',
                           'G6216',
                           'J162',
                           'J5162',
                           'J5236',
                           'K6231',
                           'L6525',
                           'P3624',
                           'R1632',
                           'R52',
                           'T5242',
                           'V2362')
       OR n.name_pcode_nf IS NULL)
  AND (ci.note IN ('(executive producer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'composer',
                   'producer')
  AND it1.id IN ('37');