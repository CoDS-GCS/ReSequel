
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('A1343',
                           'A5364',
                           'B1652',
                           'E3534',
                           'F6362',
                           'J4215',
                           'K5425',
                           'L2525',
                           'L4216',
                           'L432',
                           'M654',
                           'N2424',
                           'R5265',
                           'S3125',
                           'S3214',
                           'S6216',
                           'S6525',
                           'V4264')
  AND (ci.note IN ('(producer)',
                   '(uncredited)',
                   '(voice)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'actress',
                   'composer',
                   'director',
                   'producer')
  AND it1.id IN ('26');