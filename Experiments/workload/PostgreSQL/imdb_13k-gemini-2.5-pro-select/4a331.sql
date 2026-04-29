
SELECT COUNT(*)
FROM info_type AS it1
JOIN person_info AS pi1 ON it1.id = pi1.info_type_id
JOIN name AS n ON pi1.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE it1.id IN ('26')
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('B4516',
                           'C625',
                           'D1323',
                           'E4563',
                           'I5124',
                           'J2145',
                           'J4165',
                           'J5162',
                           'L564',
                           'M65',
                           'R1636',
                           'R232'))
  AND (ci.note IN ('(account head)',
                   '(assistant location manager)',
                   '(supervising producer)',
                   '(writer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actress',
                   'cinematographer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer');