
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE n.gender IN ('f')
  AND n.name_pcode_nf IN ('A5414',
                           'C432',
                           'D6261',
                           'G1426',
                           'I6513',
                           'J2152',
                           'J462',
                           'K356',
                           'L2451',
                           'L3425',
                           'M2545',
                           'S5423',
                           'T5626')
  AND (ci.note IN ('(actors director)')
       OR ci.note IS NULL)
  AND rt.role IN ('actress',
                   'miscellaneous crew')
  AND it1.id IN ('26');