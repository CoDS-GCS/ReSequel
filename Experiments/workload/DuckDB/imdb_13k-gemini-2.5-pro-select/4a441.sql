
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('A4314',
                           'B2624',
                           'C4163',
                           'E4565',
                           'E6542',
                           'F4231',
                           'F6345',
                           'G4136',
                           'G65',
                           'I152',
                           'J425',
                           'L5414',
                           'M2451',
                           'M2521',
                           'N2164',
                           'N425',
                           'O6545',
                           'S3154',
                           'S462',
                           'T5626',
                           'W4316',
                           'W46')
  AND (ci.note IN ('(as Lemuelle Pelayo)',
                   '(clearance coordinator)',
                   '(co-producer)',
                   '(executive producer) (as Gail Patrick Jackson)',
                   '(executive producer)',
                   '(producer)',
                   '(uncredited)',
                   '(voice)',
                   '(writer)',
                   '(written by)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'actress',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('25');