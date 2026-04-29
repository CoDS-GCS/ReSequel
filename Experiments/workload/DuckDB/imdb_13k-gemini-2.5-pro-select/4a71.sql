
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE rt.role IN ('actor',
                   'actress',
                   'composer',
                   'director',
                   'editor',
                   'producer',
                   'writer')
  AND it1.id IN ('31')
  AND n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('B6535',
                           'C5323',
                           'D1523',
                           'E3525',
                           'E5634',
                           'F32',
                           'G4656',
                           'H425',
                           'J2452',
                           'J5162',
                           'J5251',
                           'J5452',
                           'M5415',
                           'P4642',
                           'S3541',
                           'T3525',
                           'T5121',
                           'T5636',
                           'W4521',
                           'Y2424')
  AND (ci.note IN ('(archive footage)',
                   '(as Brandy)',
                   '(as Guillermo)',
                   '(as Jackie García)',
                   '(as Johnny Williams)',
                   '(as Timothy Ryder)',
                   '(co-producer)',
                   '(producer)',
                   '(story)')
       OR ci.note IS NULL);