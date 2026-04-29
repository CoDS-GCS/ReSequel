
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('22')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'actress',
                   'costume designer',
                   'editor',
                   'producer',
                   'production designer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A5462',
                           'B4262',
                           'B5452',
                           'C4524',
                           'C5353',
                           'C6423',
                           'D162',
                           'H6432',
                           'J4525',
                           'J5424',
                           'R52',
                           'S325'))
  AND (ci.note IN ('(producer)',
                   '(supervising producer)',
                   '(voice)')
       OR ci.note IS NULL);