
SELECT COUNT(*)
FROM info_type AS it1
JOIN person_info AS pi1 ON it1.id = pi1.info_type_id
JOIN name AS n ON pi1.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE it1.id IN ('26')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A3525',
                           'A4523',
                           'D2652',
                           'J2163',
                           'L5352',
                           'T5351',
                           'T6243'))
  AND (ci.note IN ('(creator)',
                   '(producer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'composer',
                   'producer',
                   'writer');