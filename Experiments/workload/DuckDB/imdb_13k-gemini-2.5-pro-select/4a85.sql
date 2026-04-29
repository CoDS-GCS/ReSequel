
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('37')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'composer',
                   'costume designer',
                   'director',
                   'editor',
                   'producer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A3651',
                           'A5352',
                           'C4514',
                           'E256',
                           'G6215',
                           'K6423',
                           'L65',
                           'P6125',
                           'P636',
                           'R2452',
                           'S1326',
                           'S2524'))
  AND (ci.note IN ('(as Audrey Bansmer)',
                   '(executive producer)',
                   '(uncredited)',
                   '(written by)')
       OR ci.note IS NULL);