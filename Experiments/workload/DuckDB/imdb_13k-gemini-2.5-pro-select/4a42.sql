
SELECT COUNT(*)
FROM info_type AS it1
JOIN person_info AS pi1 ON it1.id = pi1.info_type_id
JOIN name AS n ON pi1.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE it1.id IN ('37')
  AND (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A5364',
                           'B1542',
                           'B6352',
                           'C6425',
                           'C6431',
                           'J512',
                           'J6356',
                           'L2316',
                           'L621',
                           'S4563',
                           'S65'))
  AND (ci.note IN ('(archive footage)',
                   '(associate producer)',
                   '(creative producer)',
                   '(line producer)',
                   '(producer)',
                   '(voice) (uncredited)',
                   '(writer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'actress',
                   'composer',
                   'producer',
                   'writer');