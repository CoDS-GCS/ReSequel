
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('19')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
                   'costume designer',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('C6354',
                           'D1326',
                           'E2362',
                           'J215',
                           'J6163',
                           'K262',
                           'K6516',
                           'L6262',
                           'M6232',
                           'M625',
                           'M6263',
                           'M6265',
                           'M6341',
                           'R1265',
                           'S3142',
                           'S5625',
                           'S6452',
                           'V5256'))
  AND (ci.note IN ('(co-executive producer)',
                   '(creator)',
                   '(executive producer)',
                   '(producer)',
                   '(production assistant)',
                   '(production coordinator)',
                   '(researcher)',
                   '(voice)')
       OR ci.note IS NULL);