
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE rt.role IN ('actor',
                   'composer',
                   'director',
                   'producer',
                   'writer')
  AND it1.id IN ('26')
  AND n.gender IN ('m')
  AND n.name_pcode_nf IN ('A1452',
                           'A2542',
                           'B2615',
                           'C6424',
                           'C6425',
                           'C6541',
                           'C6542',
                           'D564',
                           'E3561',
                           'E62',
                           'G6356',
                           'H5653',
                           'H6163',
                           'J1231',
                           'J5125',
                           'J5216',
                           'K512',
                           'M2423',
                           'P3626',
                           'P45',
                           'S5143',
                           'T5462')
  AND (ci.note IN ('(supervising producer)',
                   '(uncredited)',
                   '(voice)',
                   '(writer)',
                   '(written by) (as Herb Sargent)')
       OR ci.note IS NULL);