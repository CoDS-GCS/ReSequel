
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('22')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A232',
                           'A2424',
                           'A5361',
                           'D1325',
                           'D1353',
                           'F4125',
                           'G654',
                           'L6142',
                           'M2452',
                           'M52',
                           'M6312',
                           'R5362',
                           'R5425',
                           'S6153',
                           'V1541'))
  AND (ci.note IN ('(assistant to producers)',
                   '(associate producer) (as Roy Nelson Rojas Vargas)',
                   '(associate producer)',
                   '(segment director)',
                   '(written by)')
       OR ci.note IS NULL);