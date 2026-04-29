
SELECT COUNT(*)
FROM info_type AS it1
JOIN person_info AS pi1 ON it1.id = pi1.info_type_id
JOIN name AS n ON pi1.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE it1.id IN ('34')
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A3526',
                           'A5326',
                           'A5362',
                           'B6515',
                           'E3632',
                           'F5265',
                           'G6215',
                           'H3652',
                           'H4543',
                           'K5363',
                           'P1562',
                           'S1321',
                           'S3246',
                           'T3625',
                           'V62',
                           'W4542',
                           'Y25'))
  AND (ci.note IN ('(assistant coordinator)',
                   '(assistant location manager)',
                   '(assistant to Maxine Shaw)',
                   '(assistant to director)',
                   '(associate producer)',
                   '(co-executive producer)',
                   '(locations)',
                   '(producer)',
                   '(story producer)',
                   '(voice: Japanese version)')
       OR ci.note IS NULL)
  AND rt.role IN ('actress',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer');