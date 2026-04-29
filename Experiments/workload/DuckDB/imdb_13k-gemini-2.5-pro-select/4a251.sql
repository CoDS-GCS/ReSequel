
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('22')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'actress',
                   'producer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('J1623',
                           'J252',
                           'J5235',
                           'J5616',
                           'M325',
                           'P3626',
                           'S1652'))
  AND (ci.note IN ('(producer)')
       OR ci.note IS NULL);