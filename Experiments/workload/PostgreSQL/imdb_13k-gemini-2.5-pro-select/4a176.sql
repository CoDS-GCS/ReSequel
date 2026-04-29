
SELECT COUNT(*)
FROM info_type AS it1
JOIN person_info AS pi1 ON it1.id = pi1.info_type_id
JOIN name AS n ON pi1.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE it1.id IN ('34')
  AND (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('C6426',
                           'F6535',
                           'M2426',
                           'P3621',
                           'P3624',
                           'P3625',
                           'R3625',
                           'T5214'))
  AND (ci.note IN ('(producer)',
                   '(writer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'actress',
                   'producer',
                   'writer');