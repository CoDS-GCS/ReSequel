
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE rt.role IN ('actress')
  AND it1.id IN ('32')
  AND n.gender IN ('f')
  AND n.name_pcode_nf IN ('J5253',
                           'L6324',
                           'P2435',
                           'R3632',
                           'T2532')
  AND (ci.note IN ('(as Lurdes Lima)',
                   '(voice)')
       OR ci.note IS NULL);