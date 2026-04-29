
SELECT COUNT(*)
FROM info_type AS it1
JOIN person_info AS pi1 ON it1.id = pi1.info_type_id
JOIN name AS n ON pi1.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE it1.id IN ('34')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('B156',
                           'B562',
                           'B6252',
                           'C5235',
                           'C6423',
                           'C652',
                           'D2452',
                           'G6543',
                           'J2324',
                           'J4163',
                           'J4263',
                           'J5145',
                           'J5265',
                           'K152',
                           'K1521',
                           'M2421',
                           'M2565',
                           'M3152',
                           'P3263',
                           'Q5642',
                           'S1235',
                           'S3154',
                           'S4235',
                           'T3261'))
  AND (ci.note IN ('(as The Basic Cable Band)',
                   '(creator)',
                   '(executive producer)',
                   '(producer)',
                   '(production assistant)',
                   '(technical supervisor) (as Peter Gardiner)',
                   '(writer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'cinematographer',
                   'composer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer');