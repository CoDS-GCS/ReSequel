
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A4523',
                           'A6535',
                           'B1453',
                           'B4135',
                           'B6535',
                           'C6241',
                           'D1352',
                           'D525',
                           'E6265',
                           'G5615',
                           'J4232',
                           'J5161',
                           'K6423',
                           'L6252',
                           'M5256',
                           'M6132',
                           'M6252',
                           'M6265',
                           'N12',
                           'P3631',
                           'P4152',
                           'S2345',
                           'T62',
                           'V4535'))
  AND (ci.note IN ('(co-producer)',
                   '(executive assistant to Bonnie Hunt)',
                   '(executive producer)',
                   '(location coordinator)',
                   '(location manager)',
                   '(producer)',
                   '(production coordinator) (as Mari Carmen Moreno Laguillo)',
                   '(production coordinator)',
                   '(production staff)',
                   '(researcher)',
                   '(voice)')
       OR ci.note IS NULL)
  AND rt.role IN ('actress',
                   'composer',
                   'costume designer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer')
  AND it1.id IN ('19');