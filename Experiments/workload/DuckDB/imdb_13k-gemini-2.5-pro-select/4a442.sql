
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('25')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
                   'composer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A526',
                           'B6535',
                           'D162',
                           'F545',
                           'H4123',
                           'J1235',
                           'J524',
                           'J5616',
                           'K543',
                           'L2425',
                           'L2525',
                           'L3142',
                           'L4526',
                           'M4241',
                           'M426',
                           'M6216',
                           'N215',
                           'P4263',
                           'P5232',
                           'S3632',
                           'T45',
                           'T625',
                           'T64',
                           'V4651'))
  AND (ci.note IN ('(credit only)',
                   '(executive producer)',
                   '(producer)',
                   '(production assistant)',
                   '(production coordinator)',
                   '(promo producer)',
                   '(script supervisor)',
                   '(talent coordinator)',
                   '(writer)',
                   '(written by)')
       OR ci.note IS NULL);