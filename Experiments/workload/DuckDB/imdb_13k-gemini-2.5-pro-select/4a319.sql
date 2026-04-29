WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('A53',
                           'A6234',
                           'A6354',
                           'D52',
                           'G4642',
                           'H4356',
                           'H463',
                           'J4165',
                           'K4124',
                           'L16',
                           'L4313',
                           'M3243',
                           'M5363',
                           'M6421',
                           'M6525',
                           'P36',
                           'R5251',
                           'S5252',
                           'S6563'))
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
  AND it1.id IN ('19')
  AND (ci.note IN ('(as Ann Todd)',
                   '(creative consultant)',
                   '(pre-production coordinator)',
                   '(producer)',
                   '(researcher)',
                   '(uncredited)',
                   '(voice)')
       OR ci.note IS NULL);