
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('26')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
                   'producer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A5236',
                           'A5362',
                           'B6232',
                           'G1645',
                           'G6252',
                           'J5352',
                           'L24',
                           'L262',
                           'M6214',
                           'M6254',
                           'M6353',
                           'M6425',
                           'N2421',
                           'R2565',
                           'S6163'))
  AND (ci.note IN ('(producer)')
       OR ci.note IS NULL);