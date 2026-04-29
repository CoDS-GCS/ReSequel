
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('19')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
                   'director',
                   'producer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('D5165',
                           'E4516',
                           'J2454',
                           'J5362',
                           'K6232',
                           'M6351',
                           'R2416',
                           'R2456',
                           'R2632'))
  AND (ci.note IN ('(head writer)',
                   '(producer)')
       OR ci.note IS NULL);