
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE n.gender IN ('m')
  AND n.name_pcode_nf IN ('A623',
                           'B4246',
                           'B5325',
                           'D5654',
                           'G2526',
                           'J2561',
                           'J52',
                           'L2124',
                           'M3632',
                           'M6212',
                           'N1453',
                           'N2423',
                           'O4165',
                           'O4652',
                           'Q5253',
                           'T5246',
                           'V4356',
                           'W2423')
  AND (ci.note IN ('(as Cruz y Raya)',
                   '(as Jason Robards)',
                   '(producer)',
                   '(switcher director)',
                   '(uncredited)',
                   '(voice)',
                   '(voice: English version)',
                   '(writer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'composer',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('26');