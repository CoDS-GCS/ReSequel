
SELECT COUNT(*)
FROM info_type AS it1
JOIN person_info AS pi1 ON it1.id = pi1.info_type_id
JOIN name AS n ON pi1.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE it1.id IN ('19')
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A5362',
                           'A5365',
                           'C6231',
                           'E4213',
                           'J5164',
                           'J5253',
                           'L25',
                           'M6214',
                           'N2421',
                           'R516',
                           'S252'))
  AND (ci.note IN ('(executive producer)',
                   '(senior producer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actress',
                   'composer',
                   'producer');