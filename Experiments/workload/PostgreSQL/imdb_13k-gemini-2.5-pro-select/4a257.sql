
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A6536',
                           'B1252',
                           'C6423',
                           'F4351',
                           'G6243',
                           'G6353',
                           'H5141',
                           'J5132',
                           'J52',
                           'L5436',
                           'P4626',
                           'W4526')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actor',
                   'director',
                   'producer',
                   'writer')
  AND it1.id IN ('31')
  AND (ci.note IN ('(associate producer)',
                   '(creator)',
                   '(producer)',
                   '(studio)',
                   '(uncredited)')
       OR ci.note IS NULL);