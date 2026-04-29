
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('37')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
                   'composer',
                   'costume designer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A5252',
                           'C5321',
                           'C6234',
                           'C6252',
                           'C6424',
                           'C6565',
                           'D5153',
                           'D5416',
                           'D6313',
                           'E4516',
                           'E6236',
                           'F6525',
                           'G6363',
                           'H6325',
                           'J5231',
                           'K6534',
                           'L3256',
                           'M2523',
                           'M4563',
                           'P4251',
                           'R2635',
                           'S4245',
                           'T523',
                           'U5231'))
  AND (ci.note IN ('(key crafts service) (uncredited)',
                   '(producer)',
                   '(story)',
                   '(uncredited)',
                   '(voice)')
       OR ci.note IS NULL);