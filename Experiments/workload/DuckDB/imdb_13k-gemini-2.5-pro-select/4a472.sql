
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('B2346',
                           'C63',
                           'E6423',
                           'F5362',
                           'J2612',
                           'J545',
                           'L5625',
                           'N2513',
                           'R1521',
                           'R523',
                           'S3541',
                           'S632',
                           'T6236',
                           'U4621'))
  AND (ci.note IN ('(assistant producer)',
                   '(characters created by)',
                   '(co-producer)',
                   '(consultant writer)',
                   '(producer)',
                   '(uncredited)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'actress',
                   'director',
                   'producer',
                   'production designer',
                   'writer')
  AND it1.id IN ('31');