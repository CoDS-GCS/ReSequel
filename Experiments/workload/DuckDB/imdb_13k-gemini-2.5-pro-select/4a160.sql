
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
WHERE rt.role IN ('actress',
                   'cinematographer',
                   'composer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND (ci.note IN ('(Animax Asia dub)',
                   '(deko operator)',
                   '(director of photography)',
                   '(producer)',
                   '(production coordinator)',
                   '(written by)')
       OR ci.note IS NULL)
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A4253',
                           'A5362',
                           'A5364',
                           'C453',
                           'C62',
                           'D5453',
                           'D6326',
                           'E5624',
                           'F5245',
                           'H3614',
                           'J2152',
                           'J2525',
                           'K5253',
                           'L235',
                           'L2412',
                           'L265',
                           'M1436',
                           'M6352',
                           'R3536',
                           'S3152',
                           'S636',
                           'T2352',
                           'Z2521'))
  AND it1.id IN ('19');