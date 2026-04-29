
SELECT COUNT(*)
FROM
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
                           'S6563')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT person_id,
          role_id
   FROM cast_info
   WHERE note IN ('(as Ann Todd)',
                   '(creative consultant)',
                   '(pre-production coordinator)',
                   '(producer)',
                   '(researcher)',
                   '(uncredited)',
                   '(voice)')
     OR note IS NULL) AS ci ON n.id = ci.person_id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress',
                   'miscellaneous crew',
                   'producer')) AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN
  (SELECT id
   FROM info_type
   WHERE id IN ('19')) AS it1 ON pi1.info_type_id = it1.id;