
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE rt.role IN ('actress',
                   'writer')
  AND it1.id IN ('37')
  AND n.gender IN ('f')
  AND n.name_pcode_nf IN ('C6235',
                           'P35',
                           'P3516',
                           'S1263',
                           'Y3252')
  AND (ci.note IN ('(dialogue)')
       OR ci.note IS NULL);