
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE rt.role IN ('actor',
                   'composer',
                   'producer')
  AND it1.id IN ('31')
  AND n.gender IN ('m')
  AND n.name_pcode_nf IN ('C6215',
                           'C6426',
                           'D1314',
                           'H626',
                           'K314',
                           'M452',
                           'M526',
                           'P2415',
                           'S1254')
  AND (ci.note IN ('(executive producer)')
       OR ci.note IS NULL);