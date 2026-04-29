
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
                   'producer',
                   'production designer')
  AND (ci.note IN ('(original score)',
                   '(president: Tyler Perry Studios)',
                   '(producer)')
       OR ci.note IS NULL)
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('J6362',
                           'O26',
                           'R5414',
                           'S1526',
                           'V4616',
                           'W4362'))
  AND it1.id IN ('37');