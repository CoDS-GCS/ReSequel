
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('26')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
                   'cinematographer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f')
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
       OR ci.note IS NULL);