
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('25')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
                   'cinematographer',
                   'costume designer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A5326',
                           'B6523',
                           'C432',
                           'C6454',
                           'E1356',
                           'E2524',
                           'E4543',
                           'H4534',
                           'H4565',
                           'H6431',
                           'J5136',
                           'J5163',
                           'J5256',
                           'J6516',
                           'K3252',
                           'K4562',
                           'L6245',
                           'M6263',
                           'P3625',
                           'P5261',
                           'S3125',
                           'S542',
                           'T5635',
                           'T6421'))
  AND (ci.note IN ('(assistant armorer) (uncredited)',
                   '(co-executive producer)',
                   '(producer)',
                   '(production assistant)',
                   '(public relations)',
                   '(script typist)',
                   '(story editor)',
                   '(voice actor)',
                   '(writer)')
       OR ci.note IS NULL);