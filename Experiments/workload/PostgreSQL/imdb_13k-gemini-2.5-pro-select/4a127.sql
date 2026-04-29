
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('32')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'cinematographer',
                   'costume designer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A1631',
                           'B6161',
                           'B6365',
                           'D1364',
                           'D1451',
                           'G424',
                           'G6262',
                           'H1432',
                           'I5216',
                           'J6256',
                           'K1536',
                           'K525',
                           'L2363',
                           'L6361',
                           'M2346',
                           'M5626',
                           'P4616',
                           'R2126',
                           'R5212',
                           'S3156',
                           'T5256',
                           'T5636',
                           'T6214',
                           'T6451',
                           'V535'))
  AND (ci.note IN ('(administrator)',
                   '(adprom officer)',
                   '(as Westlife)',
                   '(business and legal affairs)',
                   '(creative consultant)',
                   '(director of photography)',
                   '(executive producer)',
                   '(line producer)',
                   '(producer)',
                   '(publicity manager)',
                   '(script coordinator)',
                   '(supervising editor)',
                   '(voice)')
       OR ci.note IS NULL);