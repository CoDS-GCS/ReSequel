WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A623',
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
                           'W2423')),
     filtered_roles AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'composer',
                   'miscellaneous crew',
                   'producer',
                   'writer'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN aka_name AS an ON fn.id = an.person_id
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN filtered_roles AS fr ON ci.role_id = fr.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE it1.id IN ('26')
  AND (ci.note IN ('(as Cruz y Raya)',
                   '(as Jason Robards)',
                   '(producer)',
                   '(switcher director)',
                   '(uncredited)',
                   '(voice)',
                   '(voice: English version)',
                   '(writer)')
       OR ci.note IS NULL);