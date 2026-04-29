
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
WHERE rt.role IN ('actor',
                   'composer',
                   'miscellaneous crew',
                   'writer')
  AND (ci.note IN ('(story editor)',
                   '(writer)')
       OR ci.note IS NULL)
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A2463',
                           'A5326',
                           'D1326',
                           'D26',
                           'H6325',
                           'J2613',
                           'J565',
                           'O3423',
                           'W3235'))
  AND it1.id IN ('31');